import streamlit as st 
import database.connection
import pandas as pd

st.header("Dashboard Censo Escolar Rio Claro 2017")

st.markdown("""
     Primeira **linha** *aqui()       
            
            """)

conn = database.connection.get_connection()

cursor = conn.cursor()
cursor.execute("select * from v_escola;")
res = cursor.fetchall()

df = pd.DataFrame(res,columns = cursor.column_names)

st.write(df)

# st.sidebar.header("Meu sidebar")
# st.sidebar.radio("Meu radio", df['NO_ENTIDADE'].unique())