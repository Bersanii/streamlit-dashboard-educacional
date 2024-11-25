import streamlit as st 
import database.connection

st.header(f'Olá {st.session_state.usuario['NOME']}, esses são seus bookmarks.')

query = f'''
  SELECT * FROM v_bookmarks_usuario WHERE id_usuario = {st.session_state.usuario['ID']}
'''

df = database.connection.run_query(query, True)
st.dataframe(df, use_container_width=True)

# Seleção do bookmark para remoção
bookmark_id = st.selectbox('Escolha um bookmark para remover', df['id'].tolist())

# Botão de remoção
if st.button('Remover Bookmark'):
  if bookmark_id:
    # Executando a query de remoção
    delete_query = f'DELETE FROM bookmark WHERE id = {bookmark_id} AND id_usuario = {st.session_state.usuario['ID']}'
    try:
      database.connection.run_query(delete_query, False)
      st.success('Bookmark removido com sucesso!')
    except Exception as e:
      st.error(f'Erro ao remover o bookmark: {e}')