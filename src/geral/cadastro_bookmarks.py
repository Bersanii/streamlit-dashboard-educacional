import streamlit as st 
import database.connection
import mysql.connector
from mysql.connector import errorcode
import time

query_escolas = "SELECT * FROM v_escola"
escolas_df = database.connection.run_query(query_escolas, True)

def validar(escola_selecionada):
  if not escola_selecionada:
    return False
  return True

def cadastra_bookmark(escola_selecionada, descricao):
  try:
    query = f'''
      INSERT INTO bookmark (ID_USUARIO, CODIGO_ESCOLA, DESCRICAO)
      VALUES ({st.session_state.usuario['ID']}, {escola_selecionada.codigo}, '{descricao}');
    '''
    database.connection.run_query(query)
    st.success("Cadastrado com sucesso")
    time.sleep(2)
    st.rerun()
  except mysql.connector.Error as err:
    # Verifica se é um erro SQLSTATE '45000' (customizado pela trigger)
    if err.errno == errorcode.ER_SIGNAL_EXCEPTION:  # ER_SIGNAL_EXCEPTION representa erros de SIGNAL.
      st.error(f"Trigger: {err.msg}")
    else:
      # Outros erros
      st.error(f"Erro: {err}")

with st.form("cadastro_bookmark"):
  st.title("Cadastro de Bookmark")
  escola_selecionada = st.selectbox(
    "Selecione a escola que deseja adicionar aos seus bookmarks",
    options=escolas_df.itertuples(index=False),  
    format_func=lambda u: u.nome  # Exibe o nome no selectbox
  )
  descricao = st.text_area('Descrição')
  submit = st.form_submit_button("Salvar")

  if submit and validar(escola_selecionada):
    cadastra_bookmark(escola_selecionada, descricao)
  elif submit:
    st.warning("Dados inválidos!")
