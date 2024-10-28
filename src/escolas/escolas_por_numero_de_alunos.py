import streamlit as st 
import database.connection

st.header("Escolas Ordenadas por Número de Alunos")
query = """
select e.NO_ENTIDADE, count(distinct m.CO_PESSOA_FISICA) as total_alunos
FROM escola e
left join matricula m ON e.CO_ENTIDADE = m.CO_ENTIDADE
group by e.CO_ENTIDADE
order by total_alunos DESC;
"""
df = database.connection.run_query(query, True)
st.dataframe(df)