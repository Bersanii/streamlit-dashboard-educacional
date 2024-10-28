import streamlit as st 
import database.connection

st.header("Total de Alunos, Professores e Turmas por Escola")
query = """
  SELECT 
      e.NO_ENTIDADE,
      (SELECT COUNT(DISTINCT m.CO_PESSOA_FISICA) 
      FROM matricula m 
        WHERE m.CO_ENTIDADE = e.CO_ENTIDADE) AS total_alunos,
      (SELECT COUNT(DISTINCT d.CO_PESSOA_FISICA) 
      FROM docente d 
      WHERE d.CO_ENTIDADE = e.CO_ENTIDADE) AS total_professores,
      (SELECT COUNT(DISTINCT t.ID_TURMA) 
      FROM turma t 
      WHERE t.CO_ENTIDADE = e.CO_ENTIDADE) AS total_turmas
      FROM escola e;
  """
df = database.connection.run_query(query, True)
st.dataframe(df)