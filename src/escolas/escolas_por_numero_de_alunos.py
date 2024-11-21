import streamlit as st 
import database.connection

st.header("Escolas Ordenadas por Número de Alunos")
query = """
    SELECT 
        e.nome, 
        count(distinct m.codigo) AS total_alunos
    FROM v_escola e
    LEFT JOIN v_matricula m ON e.codigo = m.codigo_escola
    GROUP BY e.codigo
    ORDER BY total_alunos DESC;
"""
df = database.connection.run_query(query, True)
st.dataframe(df)