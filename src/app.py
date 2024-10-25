import streamlit as st 

if "logged_in" not in st.session_state:
  st.session_state.logged_in = True

def login():
  if st.button("Log in"):
    st.session_state.logged_in = True
    st.rerun()

def logout():
  if st.button("Log out"):
    st.session_state.logged_in = False
    st.rerun()

login_page = st.Page(login, title="Log in", icon=":material/login:")
logout_page = st.Page(logout, title="Log out", icon=":material/logout:")

if st.session_state.logged_in:
  pg = st.navigation(
    {
      "Conta": [logout_page],
      "Relatorios": [
        st.Page("relatorios/dashboard.py", title="Dashboard", icon=":material/dashboard:", default=True),
        st.Page("relatorios/usuarios.py", title="Usuarios", icon=":material/dashboard:")
      ],
      "Formulários": [
        st.Page("forms/cadastro_usuario.py", title="Cadastro usuário", icon=":material/dashboard:")
      ],
      "Dados_escolas":[
        st.Page("dados_escolas/consultas.py", title="Consulta",icon=None)
      ]
    }
  )
else:
  pg = st.navigation([login_page])

pg.run()