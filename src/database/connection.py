import streamlit as st 
import mysql.connector

def get_connection():
  return mysql.connector.connect(host = st.secrets['db_host'], user = st.secrets['db_user'], password = st.secrets['db_pass'], port = st.secrets['db_port'], db = 'labbd', auth_plugin = 'mysql_native_password')