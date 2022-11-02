from msilib.schema import CheckBox
import streamlit as st
import pandas as pd
import requests
import plotly.express as px


df_bicis = pd.read_csv('FiltradoBicis.csv')

menu_lateral = st.sidebar.selectbox('MENU',['HOME','DATOS','VISUALIZACION','FILTRO'])
with st.expander('Pulsa para comenzar la fiesta'):
    st.balloons()

checkbox = st.checkbox('Clickname y suma 1')

if checkbox:
    st.title('Esta es mi aplicacion web')
    st.markdown('Me has clikado')
if menu_lateral == 'HOME':
    st.title('Bienvenido a mi primera aplicacion')
elif menu_lateral == 'DATOS':
    st.title('Datos bicis en Sevilla')
    st.metric('Numero Total de Sevicis', df_bicis['capacity'].sum() , delta=20, delta_color="normal", help=None)
    df_bicis
if menu_lateral == 'VISUALIZACION':
    st.title('MAPA DE BICIS EN SEVILLA :)')
    st.map(data=df_bicis, zoom=None, use_container_width=True)
if menu_lateral == 'FILTRO':
    menu_radio = st.sidebar.radio('Selecciona una opcion de filtro',('Calle','Capacidad & Distrito'))
    if menu_radio == 'Calle':
        calle = st.sidebar.selectbox('Filtrado',df_bicis['name'].unique())
        df_bicis[df_bicis['name']=='calle']
        st.dataframe(df_bicis)
        st.map(df_bicis[['lon','lat']], use_container_width= False)
