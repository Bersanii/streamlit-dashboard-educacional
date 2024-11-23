import streamlit as st 
import database.connection

st.header(f'Olá {st.session_state.usuario['NOME']}, esses são seus bookmarks.')

query = f'''
  SELECT * FROM v_bookmarks_usuario WHERE id_usuario = {st.session_state.usuario['ID']}
'''

df = database.connection.run_query(query, True)
st.dataframe(df, use_container_width=True)