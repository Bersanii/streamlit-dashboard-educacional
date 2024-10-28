import streamlit as st 

st.title("Logout")
st.write("Você tem certeza que deseja sair?")
if st.button("Logout"):
  st.session_state["logged_in"] = False
  st.session_state.usuario = None
  st.success("Logout realizado com sucesso!")
  st.rerun()