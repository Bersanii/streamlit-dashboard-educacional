import streamlit as st 
import database.connection

st.title(f'Olá {st.session_state.usuario['NOME']}, esses são seus bookmarks.')

query = f'''
  SELECT * FROM v_bookmarks_usuario WHERE id_usuario = {st.session_state.usuario['ID']}
'''

df = database.connection.run_query(query, True)


if df.size > 0:
  st.dataframe(df, use_container_width=True)
  st.divider()
  st.header('Remover bookmark')
  bookmark_id = st.selectbox('Selecione o código da bookmark que deseja remover', df['id'].tolist())
  if st.button('Remover Bookmark'):
    if bookmark_id:
      delete_query = f'DELETE FROM bookmark WHERE id = {bookmark_id} AND id_usuario = {st.session_state.usuario['ID']}'
      try:
        database.connection.run_query(delete_query, False)
        st.success('Bookmark removido com sucesso!')
        st.rerun()
      except Exception as e:
        st.error(f'Erro ao remover o bookmark: {e}')
else:
  st.info('Você não possui nenhum bookmark adicionado')
