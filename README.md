# streamlit-dashboard-educacional
Projeto de criação de um dashboard web usando a biblioteca Streamlit para o Python, a fim de analisar dados do Censo de escolas municipais da cidade de Rio Claro - SP

## Deploy na nuvem

A hospedagem do dashboard foi feita através do [Streamlit community cloud](https://streamlit.io/cloud) e o banco de dados está hospedado no [Aiven](https://aiven.io/)

**O dashboard pode ser acessado pelo link:** https://app-dashboard-educacional.streamlit.app/

---

## Execução local

### Configuração

#### Arquivos de dados

Dentro do Mysql Workbench execute a query ```SELECT @@global.secure_file_priv;``` para obter o diretório seguro para importação dos dados, copie os arquivos do diretório ```/scripts/data``` para dentro do diretório retornado pela query.

#### Criação do schema e Importação dos dados

Dentro do Mysql Workbench abra o script ```/scripts/script-main.sql```, altere o caminho de imporatação dos dados para conter o diretório encontrado no passo anterior e execute o script.
Importe os dados para um novo schema chamado ```labbd```.

### Executando

Instalar os pacotes ```pip install streamlit mysql.connector.python folium geopandas matplotlib```

Crie uma cópia do arquivo ```secrets-example.toml``` com o nome de ```secrets.toml``` e preencha com os dados da conexão para o banco de dados local.

Para executar o projeto ```streamlit run app.py```

---

## Estrutura das tabelas e funções adicionais

### Tabelas

#### `etapas_ensino`
Tabela que representa as etapas de ensino.

| Coluna      | Tipo         | Descrição                                |
|-------------|--------------|------------------------------------------|
| `id_etapa`  | INT          | Identificador único da etapa (PK).       |
| `nome_etapa`| VARCHAR(255) | Nome da etapa de ensino (NOT NULL).      |


#### `usuario`
Tabela que armazena os dados dos usuários.

| Coluna            | Tipo             | Descrição                                                              |
|-------------------|------------------|------------------------------------------------------------------------|
| `ID`              | INT             | Identificador único do usuário (PK, AUTO_INCREMENT).                   |
| `NOME`            | VARCHAR(255)    | Nome do usuário (NOT NULL).                                            |
| `DATA_NASCIMENTO` | DATE            | Data de nascimento do usuário.                                         |
| `EMAIL`           | VARCHAR(255)    | Endereço de e-mail do usuário (UNIQUE).                                |
| `DATA_CADASTRO`   | DATETIME        | Data e hora do cadastro (DEFAULT CURRENT_TIMESTAMP).                   |
| `IDADE`           | SMALLINT        | Idade calculada do usuário.                                            |
| `SENHA`           | VARCHAR(40)     | Senha criptografada do usuário (DEFAULT SHA('root')).                  |
| `ADMINISTRADOR`   | TINYINT(1)      | Indica se o usuário é administrador (0 = Não, 1 = Sim, DEFAULT 0).     |

---

#### `bookmark`
Tabela que armazena bookmarks de usuários.

| Coluna         | Tipo         | Descrição                                          |
|----------------|--------------|--------------------------------------------------|
| `ID`           | INT          | Identificador único do bookmark (PK, AUTO_INCREMENT). |
| `ID_USUARIO`   | INT          | Referência ao usuário que criou o bookmark (NOT NULL). |
| `CODIGO_ESCOLA`| INT          | Código da escola relacionada ao bookmark (NOT NULL). |
| `DESCRICAO`    | VARCHAR(255) | Descrição do bookmark.                            |

#### `escola_geo`
Tabela que armazena coordenadas geográficas das escolas.

| Coluna         | Tipo          | Descrição                  |
|----------------|---------------|----------------------------|
| `CODIGO_ESCOLA`| INT           | Código da escola (PK).     |
| `LAT`          | DECIMAL(10,7) | Latitude da escola.        |
| `LON`          | DECIMAL(10,7) | Longitude da escola.       |

### Triggers

#### `before_insert_bookmark`
Impede a criação de bookmarks duplicados para o mesmo usuário e escola.

**Evento**: Antes de inserir um registro em `bookmark`.

- **Regra**:
  - Lança um erro se o usuário já possui um bookmark para a mesma escola.


#### `before_delete_usuario`
Impede a exclusão do usuário com nome "root".

**Evento**: Antes de excluir um registro em `usuario`.

- **Regra**:
  - Lança um erro ao tentar remover o usuário root.


### Views

#### `v_usuario`
Exibe informações básicas dos usuários.

| Coluna             | Descrição                            |
|--------------------|--------------------------------------|
| `id`              | Identificador único do usuário.      |
| `nome`            | Nome do usuário.                     |
| `data_nascimento` | Data de nascimento do usuário.       |
| `email`           | Endereço de e-mail do usuário.       |
| `idade`           | Idade calculada do usuário.          |
| `administrador`   | Indica se o usuário é administrador (Sim/Não). |


#### `v_bookmarks_usuario`
Exibe os bookmarks dos usuários com o nome da escola.

| Coluna         | Descrição                           |
|----------------|-------------------------------------|
| `id`          | Identificador único do bookmark.    |
| `id_usuario`  | Identificador do usuário.           |
| `nome_escola` | Nome da escola associada ao bookmark.|
| `descricao`   | Descrição do bookmark.              |

#### `v_turma`
Exibe detalhes das turmas com suas disciplinas.

| Coluna               | Descrição                                  |
|----------------------|--------------------------------------------|
| `codigo`            | Código da turma.                           |
| `codigo_escola`     | Código da escola associada.                |
| `nome`              | Nome da turma.                             |
| `numero_matriculas` | Número de matrículas na turma.             |
| `etapa_de_ensino`   | Etapa de ensino da turma.                  |
| Demais colunas      | Indica (Sim/Não) se há disciplinas específicas. |

#### `v_matricula`
Exibe informações básicas das matrículas.

| Coluna            | Descrição                  |
|-------------------|----------------------------|
| `codigo`         | Código da matrícula.       |
| `codigo_aluno`   | Código do aluno.           |
| `codigo_escola`  | Código da escola.          |
| `etapa_de_ensino`| Etapa de ensino.           |

#### `v_escola`
Exibe informações das escolas e sua situação.

| Coluna   | Descrição                               |
|----------|-----------------------------------------|
| `codigo`| Código da escola.                       |
| `nome`  | Nome da escola.                         |
| `situacao`| Situação da escola (ex.: Em Atividade).|

#### `v_docente`
Exibe informações dos docentes e seus contratos.

| Coluna     | Descrição                                     |
|------------|-----------------------------------------------|
| `codigo`  | Identificador único do docente.               |
| `codigo_escola` | Código da escola associada.              |
| `funcao`  | Função do docente (ex.: Docente, Monitor).    |
| `contrato`| Tipo de contrato do docente.                  |

### Procedures

#### `sp_distribuicao_escolas_por_situacao`
Retorna a quantidade de escolas por situação.

| Parâmetros | Nenhum |
|------------|--------|

- **Saída**: 
  - `situacao`: Situação da escola.
  - `quantidade`: Quantidade de escolas.

#### `sp_turmas_por_etapa_ensino`
Retorna a quantidade de turmas por etapa de ensino.

| Parâmetros | Nenhum |
|------------|--------|

- **Saída**: 
  - `nome_etapa`: Nome da etapa de ensino.
  - `quantidade`: Quantidade de turmas.

#### `sp_docentes_por_funcao`
Retorna a quantidade de docentes por função.

| Parâmetros | Nenhum |
|------------|--------|

- **Saída**: 
  - `funcao`: Função do docente.
  - `quantidade`: Quantidade de docentes.

### Funções

#### `calcular_idade(data_nascimento DATE)`
Calcula a idade com base na data de nascimento.

| Parâmetro          | Tipo | Descrição                    |
|--------------------|------|------------------------------|
| `data_nascimento` | DATE | Data de nascimento do usuário.|

- **Retorno**: 
  - Idade (INT).
