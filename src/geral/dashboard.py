import streamlit as st 
import database.connection
import folium
from folium import plugins
import geopandas as gpd
from folium.plugins import MarkerCluster
import matplotlib.pyplot as plt

st.title('Dashboard')
st.text('Coleção de algumas informações e estatísticas interessantes sobre o dataset de escolas')

query_escolas = '''
    SELECT e.CO_ENTIDADE, e.NO_ENTIDADE, eg.LAT, eg.LON
    FROM escola e
    LEFT JOIN escola_geo eg ON e.CO_ENTIDADE = eg.CODIGO_ESCOLA 
'''
escolas_df = database.connection.run_query(query_escolas, True)

# Conversão para lista para facilitar a manipulação
escolas = [
    {
        'codigo': row['CO_ENTIDADE'], 
        'nome': row['NO_ENTIDADE'],
        'lat': row['LAT'],
        'lon': row['LON']
    }
    for _, row in escolas_df.iterrows()
]

# Título do app
st.subheader('Mapa de Geolocalização das escolas')
st.text('Informações coletadas do dataset adicional fornecido no classroom')

# Criando o mapa inicial (usando coordenadas médias do Brasil)
mapa = folium.Map(location=[-22.394526, -47.563428], zoom_start=11)
# Adicionando os pontos ao mapa
marker_cluster = MarkerCluster().add_to(mapa)

for escola in escolas:
    folium.Marker(
        location=[escola['lat'], escola['lon']],
        popup=f'{escola['nome']} ({escola['lat']}, {escola['lon']})'
    ).add_to(marker_cluster)
# Exibindo o mapa no Streamlit
st.components.v1.html(mapa._repr_html_(), height=500)

# Distribuição de Escolas por Situação de Funcionamento
st.subheader("Distribuição de Escolas por Situação")
escolas_df = database.connection.run_procedure("sp_distribuicao_escolas_por_situacao")
if escolas_df is not None:
    fig, ax = plt.subplots()
    ax.pie(escolas_df["quantidade"], labels=escolas_df["situacao"], autopct='%1.1f%%', startangle=90)
    ax.set_title("Distribuição de Escolas por Situação")
    st.pyplot(fig)

# Número de Turmas por Etapa de Ensino
st.subheader("Turmas por Etapa de Ensino")
turmas_df = database.connection.run_procedure("sp_turmas_por_etapa_ensino")
if turmas_df is not None:
    fig, ax = plt.subplots()
    ax.barh(turmas_df["nome_etapa"], turmas_df["quantidade"], color="green")
    ax.set_title("Turmas por Etapa de Ensino")
    ax.set_xlabel("Quantidade")
    ax.set_ylabel("Etapa de Ensino")
    st.pyplot(fig)

# Número de Matrículas por Escola
st.subheader("Docentes por Função")
docentes_df = database.connection.run_procedure("sp_docentes_por_funcao")
if docentes_df is not None:
    fig, ax = plt.subplots(figsize=(10, 6))
    ax.barh(docentes_df["funcao"], docentes_df["quantidade"], color="teal")
    ax.set_title("Quantidade de Docentes por Função")
    ax.set_xlabel("Quantidade")
    ax.set_ylabel("Função")
    st.pyplot(fig)