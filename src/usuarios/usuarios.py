import streamlit as st 
import database.connection
import mysql.connector
from mysql.connector import errorcode

st.title(f'Listagem de usuários')

query = f'''
  SELECT * FROM v_usuario
'''

df = database.connection.run_query(query, True)

st.dataframe(df, use_container_width=True)
st.divider()
st.header('Remover usuário')
usuario_selecionado = st.selectbox(
  "Selecione o usuário que deseja remover",
  options=df.itertuples(index=False),  # Usa o DataFrame como fonte de opções
  format_func=lambda u: u.nome  # Exibe o nome no selectbox
)

if st.button('Remover usuário'):
  if usuario_selecionado:
    delete_query = f'DELETE FROM usuario WHERE id = {usuario_selecionado.id}'
    try:
      database.connection.run_query(delete_query, False)
      st.success('Usuário removido com sucesso!')
      st.rerun()
    except mysql.connector.Error as err:
    # Verifica se é um erro SQLSTATE '45000' (customizado pela trigger)
      if err.errno == errorcode.ER_SIGNAL_EXCEPTION:  # ER_SIGNAL_EXCEPTION representa erros de SIGNAL.
        st.error(f"Trigger: {err.msg}")
      else:
        # Outros erros
        st.error(f"Erro: {err}")
