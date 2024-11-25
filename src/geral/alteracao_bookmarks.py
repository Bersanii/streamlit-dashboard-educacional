import streamlit as st
import database.connection
import time

def obter_bookmarks():
  try:
    query = f"SELECT * FROM v_bookmarks_usuario WHERE id_usuario = {st.session_state.usuario['ID']}"
    df = database.connection.run_query(query, return_df=True)
    return df
  except Exception as err:
    st.error(f"Erro ao buscar bookmarks: {err}")
    return None

def obter_dados_bookmark(bookmark_id):
  try:
    query = f"SELECT * FROM v_bookmarks_usuario WHERE id = {bookmark_id}"
    df = database.connection.run_query(query, return_df=True)
    if not df.empty:
      return df.iloc[0]  # Retorna a primeira linha como Series
    return None
  except Exception as err:
    st.error(f"Erro ao buscar dados do usuário: {err}")
    return None

def atualizar_bookmark(bookmark_id, descricao):
  try:
    query = f"""
      UPDATE bookmark 
      SET DESCRICAO = '{descricao}'
      WHERE ID = {bookmark_id}
    """
    database.connection.run_query(query)
    st.success("Bookmark atualizado com sucesso!")
    time.sleep(2)
    st.rerun()
  except Exception as err:
    st.error(f"Erro ao atualizar a bookmark: {err}")

st.title("Alteração de Bookmark")

# Seleção do bookmark para alteração
bookmarks_df = obter_bookmarks()
if bookmarks_df is not None and not bookmarks_df.empty:
  bookmark_selecionado = st.selectbox(
    "Selecione um bookmark para alterar",
    options=bookmarks_df.itertuples(index=False),  # Usa o DataFrame como fonte de opções
    format_func=lambda u: u.nome_escola  # Exibe o nome no selectbox
  )

  if bookmark_selecionado:
    bookmark_id = bookmark_selecionado.id
    dados_bookmark = obter_dados_bookmark(bookmark_id)

    if dados_bookmark is not None:
      with st.form("alterar_bookmark"):
        st.subheader(f"Alterar Dados do Bookmark: {dados_bookmark['nome_escola']}")
        descricao = st.text_area("Descrição", value=dados_bookmark["descricao"])
        submit = st.form_submit_button("Salvar Alterações")

        if submit:
          atualizar_bookmark(bookmark_id, descricao)
    else:
      st.warning("Nenhum dado encontrado para o Bookmark selecionado.")
else:
  st.warning("Nenhum Bookmark encontrado no banco de dados.")
