import streamlit as st
import database.connection
import time
from datetime import date

def obter_usuarios():
  try:
    query = "SELECT * FROM v_usuario WHERE nome != 'root'"
    df = database.connection.run_query(query, return_df=True)
    return df
  except Exception as err:
    st.error(f"Erro ao buscar usuários: {err}")
    return None

def obter_dados_usuario(usuario_id):
  try:
    query = f"SELECT * FROM v_usuario WHERE id = {usuario_id}"
    df = database.connection.run_query(query, return_df=True)
    if not df.empty:
      return df.iloc[0]  # Retorna a primeira linha como Series
    return None
  except Exception as err:
    st.error(f"Erro ao buscar dados do usuário: {err}")
    return None

def atualizar_usuario(usuario_id, nome, email, data_nascimento, administrador):
  try:
    admin_value = 1 if administrador else 0
    query = f"""
      UPDATE usuario 
      SET NOME = '{nome}', EMAIL = '{email}', DATA_NASCIMENTO = '{data_nascimento}', ADMINISTRADOR = {admin_value}, IDADE = calcular_idade('{data_nascimento}') 
      WHERE ID = {usuario_id}
    """
    database.connection.run_query(query)
    st.success("Usuário atualizado com sucesso!")
    time.sleep(2)
    st.rerun()
  except Exception as err:
    st.error(f"Erro ao atualizar o usuário: {err}")

# Página de alteração de usuário
st.title("Alteração de Usuário")

# Seleção do usuário para alteração
usuarios_df = obter_usuarios()
if usuarios_df is not None and not usuarios_df.empty:
  usuario_selecionado = st.selectbox(
    "Selecione um usuário para alterar",
    options=usuarios_df.itertuples(index=False),  # Usa o DataFrame como fonte de opções
    format_func=lambda u: u.nome  # Exibe o nome no selectbox
  )

  if usuario_selecionado:
    usuario_id = usuario_selecionado.id
    dados_usuario = obter_dados_usuario(usuario_id)

    if dados_usuario is not None:
      with st.form("alterar_usuario"):
        st.subheader(f"Alterar Dados do Usuário: {dados_usuario['nome']}")
        nome = st.text_input("Nome", value=dados_usuario["nome"])
        email = st.text_input("Email", value=dados_usuario["email"])
        data_nascimento = st.date_input("Data de Nascimento", value=dados_usuario["data_nascimento"], min_value=date(1900, 1, 1), max_value=date.today())
        administrador = st.checkbox("Administrador", value=bool(dados_usuario["administrador"] == 'Sim'))
        submit = st.form_submit_button("Salvar Alterações")

        if submit:
          if nome and email and data_nascimento:
            atualizar_usuario(usuario_id, nome, email, data_nascimento, administrador)
          else:
            st.warning("Todos os campos são obrigatórios!")
    else:
      st.warning("Nenhum dado encontrado para o usuário selecionado.")
else:
  st.warning("Nenhum usuário encontrado no banco de dados.")
