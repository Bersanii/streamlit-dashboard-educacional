import streamlit as st 
import database.connection

st.header("Professores e Alunos por Escola")

# Consulta para obter todos os nomes das escolas
query_escolas = "SELECT NO_ENTIDADE FROM escola"
escolas_df = database.connection.run_query(query_escolas, True)

# Preencher o selectbox com os nomes das escolas
escolas_nomes = escolas_df["NO_ENTIDADE"].tolist()
escola_selecionada = st.selectbox("Selecione a escola:", escolas_nomes)

if escola_selecionada:
  query = f"""
    SELECT 
      e.CO_ENTIDADE,
      e.NO_ENTIDADE,
      m.CO_PESSOA_FISICA AS codigo_pessoa,
      'Aluno' AS tipo
    FROM 
      escola e
    LEFT JOIN 
      matricula m ON e.CO_ENTIDADE = m.CO_ENTIDADE
    WHERE 
      e.NO_ENTIDADE = '{escola_selecionada}'  -- Substitui pelo nome selecionado

    UNION ALL

    SELECT 
      e.CO_ENTIDADE,
      e.NO_ENTIDADE,
      d.CO_PESSOA_FISICA AS codigo_pessoa,
      'Docente' AS tipo
    FROM 
      escola e
    LEFT JOIN  
      docente d ON e.CO_ENTIDADE = d.CO_ENTIDADE
    WHERE 
      e.NO_ENTIDADE = '{escola_selecionada}'  -- Substitui pelo nome selecionado

    ORDER BY 
      CO_ENTIDADE, tipo, codigo_pessoa;
  """

  df = database.connection.run_query(query, True)
  st.dataframe(df)