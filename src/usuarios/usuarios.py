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
bookmark_id = st.selectbox('Selecione o código do usuário que deseja remover', df['id'].tolist())
if st.button('Remover usuário'):
  if bookmark_id:
    delete_query = f'DELETE FROM usuario WHERE id = {bookmark_id}'
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
