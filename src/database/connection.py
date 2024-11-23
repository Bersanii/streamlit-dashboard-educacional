import streamlit as st 
import mysql.connector
import pandas as pd

def get_connection():
  return mysql.connector.connect(host = st.secrets['db_host'], user = st.secrets['db_user'], password = st.secrets['db_pass'], port = st.secrets['db_port'], db = st.secrets['db_name'], auth_plugin = 'mysql_native_password')

def run_query(query: str, return_df = False):
  conn = get_connection()
  cursor = conn.cursor()
  
  try:
    cursor.execute(query)
    
    # Se solicitado converte para df
    if return_df:
      res = cursor.fetchall()
      df = pd.DataFrame(res, columns=cursor.column_names)
      return df
    else:
      # Para INSERT, UPDATE, DELETE, etc., commit a transação
      conn.commit()
      return "Query executed successfully"    
  except Exception as e:
    print(f"An error occurred: {e}")
    conn.rollback()  # Rollback em caso de erro
    raise e
  finally:
    cursor.close()
    conn.close()