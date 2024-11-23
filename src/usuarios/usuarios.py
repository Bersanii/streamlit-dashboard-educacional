import streamlit as st 
import database.connection
import pandas as pd

conn = database.connection.get_connection()
cursor = conn.cursor()

st.header("Usuários")

cursor.execute("select * from v_usuario;")
res = cursor.fetchall()

df = pd.DataFrame(res,columns = cursor.column_names)
st.write(df)
