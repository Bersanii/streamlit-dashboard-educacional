import streamlit as st 
import database.connection

st.header("Turmas por Escola")

# Consulta para obter todos os nomes das escolas
query_escolas = "SELECT NO_ENTIDADE FROM escola"
escolas_df = database.connection.run_query(query_escolas, True)

# Preencher o selectbox com os nomes das escolas
escolas_nomes = escolas_df["NO_ENTIDADE"].tolist()
escola_selecionada = st.selectbox("Selecione a escola:", escolas_nomes)

if escola_selecionada:
  query = f"""
    SELECT 
      t.*
    FROM v_turma t
    JOIN v_escola e ON t.codigo_escola = e.codigo
    WHERE e.nome = '{escola_selecionada}';
  """

  turmas_df = database.connection.run_query(query, True)
  st.dataframe(turmas_df, use_container_width=True)