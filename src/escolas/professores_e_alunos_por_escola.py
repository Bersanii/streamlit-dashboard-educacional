import streamlit as st 
import database.connection

st.header("Professores e Alunos por Escola")

# Consulta para obter todos os nomes das escolas
query_escolas = "SELECT nome FROM v_escola"
escolas_df = database.connection.run_query(query_escolas, True)

# Preencher o selectbox com os nomes das escolas
escolas_nomes = escolas_df["nome"].tolist()
escola_selecionada = st.selectbox("Selecione a escola:", escolas_nomes)

if escola_selecionada:
  query = f"""
    SELECT 
      e.codigo,
      e.nome,
      m.codigo AS codigo_pessoa,
      'Aluno' AS tipo
    FROM v_escola e
    LEFT JOIN v_matricula m ON e.codigo = m.codigo_escola
    WHERE 
      e.nome = '{escola_selecionada}'  -- Substitui pelo nome selecionado

    UNION ALL

    SELECT 
      e.codigo,
      e.nome,
      d.codigo AS codigo_pessoa,
      'Docente' AS tipo
    FROM v_escola e
    LEFT JOIN v_docente d ON e.codigo = d.codigo_escola
    WHERE e.nome = '{escola_selecionada}'  -- Substitui pelo nome selecionado
    
    ORDER BY codigo, tipo, codigo_pessoa;
  """

  df = database.connection.run_query(query, True)
  st.dataframe(df, use_container_width=True)