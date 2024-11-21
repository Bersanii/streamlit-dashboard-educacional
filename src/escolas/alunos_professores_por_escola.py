import streamlit as st 
import database.connection

st.header("Total de Alunos, Professores e Turmas por Escola")
query = f"""
  SELECT 
    e.nome,
    ( 	
      SELECT COUNT(DISTINCT m.codigo) 
      FROM v_matricula m 
          WHERE m.codigo_escola = e.codigo
    ) AS total_alunos,
    (
      SELECT COUNT(DISTINCT d.codigo) 
      FROM v_docente d 
      WHERE d.codigo_escola = e.codigo
    ) AS total_professores,
    (
      SELECT COUNT(DISTINCT t.codigo) 
      FROM v_turma t 
      WHERE t.codigo_escola = e.codigo
    ) AS total_turmas
  FROM v_escola e;
"""
df = database.connection.run_query(query, True)
st.dataframe(df)