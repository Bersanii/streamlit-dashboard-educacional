import streamlit as st 
import database.connection
import pandas as pd
import mysql.connector

with st.form("cadastro_usuario"):
  st.title("Cadastro de usuário")
  nome = st.text_input('Nome:')
  email = st.text_input('Email:')
  senha = st.text_input('Senha:', type='password')
  submit = st.form_submit_button("Enviar")

def validar(nome, email, senha):
  if nome == '' or email == '' or senha == '':
    return False
  return True

def cadastra_usuario(nome, email, senha):
  conn = mysql.connector.connect(host = st.secrets['db_host'], user = st.secrets['db_user'], password = st.secrets['db_pass'], port = st.secrets['db_port'], db = 'labbd', auth_plugin = 'mysql_native_password')
  cursor = conn.cursor()
  query = f"INSERT INTO usuario (NOME, EMAIL, SENHA) VALUES ('{nome}', '{email}', '{senha}')"
  st.write(query)
  cursor.execute(query)
  conn.commit()
  st.success("Cadastrado com sucesso")

if submit and validar(nome, email, senha):
  cadastra_usuario(nome, email, senha)
elif submit:
  st.warning("Dados inválidos!")