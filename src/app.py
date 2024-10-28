import streamlit as st 

if "logged_in" not in st.session_state:
  st.session_state.logged_in = True

if "usuario" not in st.session_state:
  st.session_state.usuario = None

if st.session_state.logged_in:
  pg = st.navigation(
    {
      "Conta": [
        st.Page("geral/logout.py", title="Logout", icon=":material/logout:"),
      ],
      "Geral": [
        st.Page("geral/dashboard.py", title="Dashboard", icon=":material/dashboard:", default=True),
      ],
      "Usuários": [
        st.Page("usuarios/usuarios.py", title="Usuarios", icon=":material/group:"),
        st.Page("usuarios/cadastro_usuario.py", title="Cadastro usuário", icon=":material/person_add:")
      ],
      "Escolas":[
        st.Page("escolas/alunos_professores_por_escola.py", title="Alunos e Professores", icon=":material/dashboard:"),
        st.Page("escolas/escolas_por_numero_de_alunos.py", title="Ordenar por Numero de Alunos", icon=":material/dashboard:"),
        st.Page("escolas/turmas_por_escola.py", title="Turmas", icon=":material/dashboard:"),
        st.Page("escolas/professores_e_alunos_por_escola.py", title="Professores e Alunos", icon=":material/dashboard:"),
        st.Page("escolas/alunos_por_nivel_de_ensino.py", title="Alunos por Nível", icon=":material/dashboard:"),
      ]
    }
  )
else:
  pg = st.navigation([st.Page("geral/login.py", title="Login", icon=":material/login:", default=True),])

pg.run()