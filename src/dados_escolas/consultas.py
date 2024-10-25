import streamlit as st
import mysql.connector
import pandas as pd
import database.connection


def executar_consulta(query):
    conn = database.connection.get_connection()
    df = pd.read_sql(query, conn)
    conn.close()
    return df


st.header("Consulta dos Dados")

opcao = st.selectbox(
    "Selecione a opção para visualizar:",
    [
        "Escolas",
        "Total de Alunos e Professores por Escola",
        "Ordenar Escolas por Número de Alunos",
        "Turmas por Escola",
        "Professores e Alunos por Escola",
        "Alunos por Nível de Ensino",
    ],
)
#Listar as escolas da cidade (nome, status de funcionamento, município, localização,
#dependência, níveis atendidos: EI, EF1, EF2, EM, EJA, EP, EE)

# funcionando, esta faltando a parte referente as estapas de ensino

if opcao == "Escolas":
    st.header("Lista de Escolas")
    query = """
    select NO_ENTIDADE, TP_SITUACAO_FUNCIONAMENTO, CO_MUNICIPIO, TP_LOCALIZACAO, TP_DEPENDENCIA 
    from escola;
    """
    df = executar_consulta(query)
    st.dataframe(df)


# Mostrar total de alunos, professores e turmas por escola

# codigo funcionando no bd

elif opcao == "Total de Alunos e Professores por Escola":
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
    df = executar_consulta(query)
    st.dataframe(df)


# Ordenar as escolas pelo número de alunos

# codigo funcionando no bd

elif opcao == "Ordenar Escolas por Número de Alunos":
    st.header("Escolas Ordenadas por Número de Alunos")
    query = """
    select e.NO_ENTIDADE, count(distinct m.CO_PESSOA_FISICA) as total_alunos
	FROM escola e
	left join matricula m ON e.CO_ENTIDADE = m.CO_ENTIDADE
    group by e.CO_ENTIDADE
    order by total_alunos DESC;
    """
    df = executar_consulta(query)
    st.dataframe(df)


# Selecionar uma escola e listar todas as turmas (nome, disciplina)

# codigo funcionando no bd


if opcao == "Turmas por Escola":
    st.header("Turmas por Escola")

    # Consulta para obter todos os nomes das escolas
    query_escolas = "SELECT NO_ENTIDADE FROM escola"
    escolas_df = executar_consulta(query_escolas)

    # Preencher o selectbox com os nomes das escolas
    escolas_nomes = escolas_df["NO_ENTIDADE"].tolist()
    escola_selecionada = st.selectbox("Selecione a escola:", escolas_nomes)

    if escola_selecionada:
        query = f"""
        SELECT 
            t.NO_turma,
            CASE WHEN t.IN_DISC_QUIMICA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_QUIMICA,
            CASE WHEN t.IN_DISC_FISICA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_FISICA,
            CASE WHEN t.IN_DISC_MATEMATICA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_MATEMATICA,
            CASE WHEN t.IN_DISC_BIOLOGIA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_BIOLOGIA,
            CASE WHEN t.IN_DISC_CIENCIAS = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_CIENCIAS,
            CASE WHEN t.IN_DISC_LINGUA_PORTUGUESA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LINGUA_PORTUGUESA,
            CASE WHEN t.IN_DISC_LINGUA_INGLES = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LINGUA_INGLES,
            CASE WHEN t.IN_DISC_LINGUA_ESPANHOL = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LINGUA_ESPANHOL,
            CASE WHEN t.IN_DISC_LINGUA_FRANCES = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LINGUA_FRANCES,
            CASE WHEN t.IN_DISC_LINGUA_OUTRA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LINGUA_OUTRA,
            CASE WHEN t.IN_DISC_LINGUA_INDIGENA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LINGUA_INDIGENA,
            CASE WHEN t.IN_DISC_ARTES = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_ARTES,
            CASE WHEN t.IN_DISC_EDUCACAO_FISICA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_EDUCACAO_FISICA,
            CASE WHEN t.IN_DISC_HISTORIA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_HISTORIA,
            CASE WHEN t.IN_DISC_GEOGRAFIA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_GEOGRAFIA,
            CASE WHEN t.IN_DISC_FILOSOFIA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_FILOSOFIA,
            CASE WHEN t.IN_DISC_ENSINO_RELIGIOSO = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_ENSINO_RELIGIOSO,
            CASE WHEN t.IN_DISC_ESTUDOS_SOCIAIS = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_ESTUDOS_SOCIAIS,
            CASE WHEN t.IN_DISC_SOCIOLOGIA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_SOCIOLOGIA,
            CASE WHEN t.IN_DISC_EST_SOCIAIS_SOCIOLOGIA = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_EST_SOCIAIS_SOCIOLOGIA,
            CASE WHEN t.IN_DISC_INFORMATICA_COMPUTACAO = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_INFORMATICA_COMPUTACAO,
            CASE WHEN t.IN_DISC_PROFISSIONALIZANTE = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_PROFISSIONALIZANTE,
            CASE WHEN t.IN_DISC_ATENDIMENTO_ESPECIAIS = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_ATENDIMENTO_ESPECIAIS,
            CASE WHEN t.IN_DISC_DIVER_SOCIO_CULTURAL = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_DIVER_SOCIO_CULTURAL,
            CASE WHEN t.IN_DISC_LIBRAS = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_LIBRAS, 
            CASE WHEN t.IN_DISC_PEDAGOGICAS = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_PEDAGOGICAS,
            CASE WHEN t.IN_DISC_OUTRAS = 1 THEN 'Sim' ELSE 'Não' END AS IN_DISC_OUTRAS
        FROM 
            turma t
        JOIN 
            escola e ON t.CO_ENTIDADE = e.CO_ENTIDADE
        WHERE 
            e.NO_ENTIDADE = '{escola_selecionada}';
        """

        turmas_df = executar_consulta(query)
        st.dataframe(turmas_df)


# Selecionar os professores e alunos de cada escola (drill-down) (cod pessoa)

# codigo funcionando no bd

elif opcao == "Professores e Alunos por Escola":
    st.header("Professores e Alunos por Escola")

    # Consulta para obter todos os nomes das escolas
    query_escolas = "SELECT NO_ENTIDADE FROM escola"
    escolas_df = executar_consulta(query_escolas)

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

        df = executar_consulta(query)
        st.dataframe(df)


# falta traduzir o codigo para as informacoes do dataset
# Agrupar o número de alunos pelo nível de ensino (EI, EFI, EFII, EM, EJA, EP)

elif opcao == "Alunos por Nível de Ensino":
    st.header("Número de Alunos por Nível de Ensino")
    query = """
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
    df = executar_consulta(query)
    st.dataframe(df)
