import streamlit as st 
import mysql.connector
import pandas as pd

st.header("primeiro titulo")

st.markdown("""
     Primeira **linha** *aqui()       
            
            """)

conn = mysql.connector.connect(host = 'localhost', user = 'root', password = 'aluno', port = 3306, db = 'labbd', auth_plugin = 'mysql_native_password')

cursor = conn.cursor()
cursor.execute("select * from escola;")
res = cursor.fetchall()

df = pd.DataFrame(res,columns = cursor.column_names)

st.write(df)

st.sidebar.header("Meu sidebar")
st.sidebar.radio("Meu radio", df['NO_ENTIDADE'].unique())



