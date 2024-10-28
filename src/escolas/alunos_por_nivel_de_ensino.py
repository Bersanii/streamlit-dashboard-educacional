import streamlit as st 
import database.connection

st.header("Número de Alunos por Nível de Ensino")

query = f"""
  SELECT 
    e.nome_etapa AS etapa_ensino,
    COUNT(DISTINCT m.CO_PESSOA_FISICA) AS total_alunos
    FROM 
    matricula m
    JOIN 
    etapas_ensino e ON m.TP_ETAPA_ENSINO = e.id_etapa
    GROUP BY 
    e.nome_etapa
    ORDER BY 
    total_alunos DESC;
"""

turmas_df = database.connection.run_query(query, True)
st.dataframe(turmas_df)