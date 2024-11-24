import streamlit as st 
import database.connection
import folium
from folium import plugins
import geopandas as gpd
from folium.plugins import MarkerCluster

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
st.title('Mapa de Geolocalização de Pontos')

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
