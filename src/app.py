import streamlit as st 

if 'logged_in' not in st.session_state:
  st.session_state.logged_in = False

if 'usuario' not in st.session_state:
  st.session_state.usuario = None

##########################################################################
# DEVMODE logar automaticamente no root, deixar descomentado somente enquanto estiver testando
##########################################################################
import database.connection
query = f"SELECT * FROM usuario WHERE NOME = 'root' AND SENHA = sha('root')"
result = database.connection.run_query(query, True)
st.session_state["logged_in"] = True
usuario = result.iloc[0]
st.session_state["usuario"] = usuario
##########################################################################

if not st.session_state.logged_in: # Não está logado
  pg = st.navigation([st.Page("geral/login.py", title="Login", icon=":material/login:", default=True),])
elif st.session_state.logged_in and st.session_state.usuario['ADMINISTRADOR']: # Logado e é adminstrador
  pg = st.navigation(
    {
      "Conta": [
        st.Page("geral/logout.py", title="Logout", icon=":material/logout:"),
        st.Page("geral/bookmarks.py", title="Bookmarks", icon=":material/bookmark:"),
        st.Page("geral/cadastro_bookmarks.py", title="Cadastro Bookmarks", icon=":material/bookmark_add:"),
      ],
      "Geral": [
        st.Page("geral/dashboard.py", title="Dashboard", icon=":material/dashboard:", default=True),
      ],
      "Usuários": [
        st.Page("usuarios/usuarios.py", title="Usuarios", icon=":material/group:"),
        st.Page("usuarios/cadastro_usuario.py", title="Cadastro usuário", icon=":material/person_add:"),
        st.Page("usuarios/alteracao_usuario.py", title="Alteração usuário", icon=":material/person_edit:")
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
else: # Logado e é usuário normal
  pg = st.navigation(
    {
      "Conta": [
        st.Page("geral/logout.py", title="Logout", icon=":material/logout:"),
        st.Page("geral/bookmarks.py", title="Bookmarks", icon=":material/logout:"),
        st.Page("geral/cadastro_bookmarks.py", title="Cadastro Bookmarks", icon=":material/logout:"),
      ],
      "Geral": [
        st.Page("geral/dashboard.py", title="Dashboard", icon=":material/dashboard:", default=True),
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

pg.run()