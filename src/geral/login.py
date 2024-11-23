import streamlit as st 
import database.connection

st.title("Login")
    
# Campos de entrada de login e senha
username = st.text_input("Usuário")
password = st.text_input("Senha", type="password")

if st.button("Login"):
  # Validação de credenciais
  query = f"SELECT * FROM usuario WHERE NOME = '{username}' AND SENHA = sha('{password}')"
  result = database.connection.run_query(query, True)

  if result.size > 0:
    st.session_state["logged_in"] = True
    usuario = result.iloc[0]
    st.session_state["usuario"] = usuario
    st.success("Login realizado com sucesso!")
    st.rerun()
  else:
    st.error("Usuário ou senha incorretos.")