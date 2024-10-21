import streamlit as st 
import database.connection
import pandas as pd

conn = database.connection.get_connection()
cursor = conn.cursor()

def on_click_cadastrar_usuario():
  st.write('Button clicked!')

st.header("Usuários")

cursor.execute("select * from usuario;")
res = cursor.fetchall()

df = pd.DataFrame(res,columns = cursor.column_names)

st.button('Cadastrar Usuário', on_click=on_click_cadastrar_usuario)

st.write(df)