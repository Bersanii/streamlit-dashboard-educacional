# streamlit-dashboard-educacional
Projeto de criação de um dashboard web usando a biblioteca Streamlit para o Python, a fim de analisar dados do Censo de escolas municipais da cidade de Rio Claro - SP

## Configuração

### MySql

**Standalone**
Documentação para instalação do mysql server: https://hub.docker.com/_/mysql

**Docker**
Documentação para instalação do mysql usando docker: https://hub.docker.com/_/mysql

Para uma instalação rápida, pode-se executar ```docker-compose up``` no diretório ```/scripts``` e o container será criado automaticamente.

### Configuração dos dados

Dentro do Mysql Workbench execute a query ```SELECT @@global.secure_file_priv;``` para obter o diretório seguro para importação dos dados, copie os arquivos do diretório ```/scripts/data``` para dentro do diretório retornado pela query.

### Criação do schema e Importação dos dados

Dentro do Mysql Workbench abra o script ```/scripts/script-main.sql```, altere o caminho de imporatação dos dados para conter o diretório encontrado no passo anterior e execute o script.

## Executando

Instalar os pacotes ```pip install streamlit mysql.connector.python plotly.express matplotib```

Para executar o projeto ```streamlit run app.py```