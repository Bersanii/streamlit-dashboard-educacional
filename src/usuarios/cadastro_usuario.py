import streamlit as st
import database.connection
import mysql.connector
from mysql.connector import errorcode
import time

# Formulário de cadastro de usuário
with st.form("cadastro_usuario"):
  st.title("Cadastro de usuário")
  nome = st.text_input('Nome:')
  email = st.text_input('Email:')
  senha = st.text_input('Senha:', type='password')
  data_nascimento = st.date_input('Data de Nascimento:')
  administrador = st.checkbox('Administrador')
  submit = st.form_submit_button("Enviar")

def validar(nome, email, senha, data_nascimento):
  if nome == '' or email == '' or senha == '' or not data_nascimento:
    return False
  return True

def cadastra_usuario(nome, email, senha, data_nascimento, administrador):
  try:
    # Convertendo o valor do checkbox para um inteiro (0 ou 1)
    admin_value = 1 if administrador else 0
    query = f"""
    INSERT INTO usuario (NOME, EMAIL, SENHA, DATA_NASCIMENTO, ADMINISTRADOR) 
    VALUES ('{nome}', '{email}', '{senha}', '{data_nascimento}', {admin_value})
    """
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

if submit and validar(nome, email, senha, data_nascimento):
  cadastra_usuario(nome, email, senha, data_nascimento, administrador)
elif submit:
  st.warning("Dados inválidos!")