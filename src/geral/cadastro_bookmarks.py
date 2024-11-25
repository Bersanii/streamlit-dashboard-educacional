import streamlit as st 
import database.connection
import mysql.connector
from mysql.connector import errorcode

query_escolas = "SELECT CO_ENTIDADE, NO_ENTIDADE FROM escola"
escolas_df = database.connection.run_query(query_escolas, True)

# Conversão para lista para facilitar a manipulação
escolas = [
  {"value": row["CO_ENTIDADE"], "label": row["NO_ENTIDADE"]}
  for _, row in escolas_df.iterrows()
]
labels = [escola["label"] for escola in escolas]
value_to_label = {escola["value"]: escola["label"] for escola in escolas}
label_to_value = {escola["label"]: escola["value"] for escola in escolas}

with st.form("cadastro_bookmark"):
  st.title("Cadastro de Bookmark")
  nome = st.selectbox("Selecione a escola que deseja adicionar aos seus bookmarks", labels)
  submit = st.form_submit_button("Salvar")

def validar(nome):
  if nome == '' and label_to_value[nome] != None:
    return False
  return True

def cadastra_bookmark(nome):
  try:
    query = f'''
      INSERT INTO bookmark (ID_USUARIO, CODIGO_ESCOLA)
      VALUES ({st.session_state.usuario['ID']}, {label_to_value[nome]});
    '''
    database.connection.run_query(query)
    st.success("Cadastrado com sucesso")
  except mysql.connector.Error as err:
    # Verifica se é um erro SQLSTATE '45000' (customizado pela trigger)
    if err.errno == errorcode.ER_SIGNAL_EXCEPTION:  # ER_SIGNAL_EXCEPTION representa erros de SIGNAL.
      st.error(f"Trigger: {err.msg}")
    else:
      # Outros erros
      st.error(f"Erro: {err}")

if submit and validar(nome):
  cadastra_bookmark(nome)
elif submit:
  st.warning("Dados inválidos!")