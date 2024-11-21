use labbd;

create table turma
(
NU_ANO_CENSO int
, ID_TURMA int
, NO_TURMA varchar(80)
, TX_HR_INICIAL varchar(2)
, TX_MI_INICIAL varchar(2)
, NU_DURACAO_TURMA int
, NU_MATRICULAS int
, TP_MEDIACAO_DIDATICO_PEDAGO int
, IN_ESPECIAL_EXCLUSIVA bool
, IN_REGULAR bool
, IN_EJA bool
, IN_PROFISSIONALIZANTE bool
, TP_ETAPA_ENSINO int
, CO_CURSO_EDUC_PROFISSIONAL int
, TP_TIPO_TURMA int
, IN_MAIS_EDUCACAO bool
, NU_DIAS_ATIVIDADE int
, IN_DIA_SEMANA_DOMINGO bool
, IN_DIA_SEMANA_SEGUNDA bool
, IN_DIA_SEMANA_TERCA bool
, IN_DIA_SEMANA_QUARTA bool
, IN_DIA_SEMANA_QUINTA bool
, IN_DIA_SEMANA_SEXTA bool
, IN_DIA_SEMANA_SABADO bool
, CO_TIPO_ATIVIDADE_1 int
, CO_TIPO_ATIVIDADE_2 int
, CO_TIPO_ATIVIDADE_3 int
, CO_TIPO_ATIVIDADE_4 int
, CO_TIPO_ATIVIDADE_5 int
, CO_TIPO_ATIVIDADE_6 int
, IN_BRAILLE bool
, IN_RECURSOS_BAIXA_VISAO bool
, IN_PROCESSOS_MENTAIS bool
, IN_ORIENTACAO_MOBILIDADE bool
, IN_SINAIS bool
, IN_COMUNICACAO_ALT_AUMENT bool
, IN_ENRIQ_CURRICULAR bool
, IN_SOROBAN bool
, IN_INFORMATICA_ACESSIVEL bool
, IN_PORT_ESCRITA bool
, IN_AUTONOMIA_ESCOLAR bool
, IN_DISC_QUIMICA bool
, IN_DISC_FISICA bool
, IN_DISC_MATEMATICA bool
, IN_DISC_BIOLOGIA bool
, IN_DISC_CIENCIAS bool
, IN_DISC_LINGUA_PORTUGUESA bool
, IN_DISC_LINGUA_INGLES bool
, IN_DISC_LINGUA_ESPANHOL bool
, IN_DISC_LINGUA_FRANCES bool
, IN_DISC_LINGUA_OUTRA bool
, IN_DISC_LINGUA_INDIGENA bool
, IN_DISC_ARTES bool
, IN_DISC_EDUCACAO_FISICA bool
, IN_DISC_HISTORIA bool
, IN_DISC_GEOGRAFIA bool
, IN_DISC_FILOSOFIA bool
, IN_DISC_ENSINO_RELIGIOSO bool
, IN_DISC_ESTUDOS_SOCIAIS bool
, IN_DISC_SOCIOLOGIA bool
, IN_DISC_EST_SOCIAIS_SOCIOLOGIA bool
, IN_DISC_INFORMATICA_COMPUTACAO bool
, IN_DISC_PROFISSIONALIZANTE bool
, IN_DISC_ATENDIMENTO_ESPECIAIS bool
, IN_DISC_DIVER_SOCIO_CULTURAL bool
, IN_DISC_LIBRAS bool
, IN_DISC_PEDAGOGICAS bool
, IN_DISC_OUTRAS bool
, CO_ENTIDADE int
, CO_REGIAO int
, CO_MESORREGIAO int
, CO_MICRORREGIAO int
, CO_UF int
, CO_MUNICIPIO int
, CO_DISTRITO int
, TP_DEPENDENCIA int
, TP_LOCALIZACAO int
, TP_CATEGORIA_ESCOLA_PRIVADA int
, IN_CONVENIADA_PP bool
, TP_CONVENIO_PODER_PUBLICO int
, IN_MANT_ESCOLA_PRIVADA_EMP bool
, IN_MANT_ESCOLA_PRIVADA_ONG bool
, IN_MANT_ESCOLA_PRIVADA_SIND bool
, IN_MANT_ESCOLA_PRIVADA_SIST_S bool
, IN_MANT_ESCOLA_PRIVADA_S_FINS bool
, TP_REGULAMENTACAO int
, TP_LOCALIZACAO_DIFERENCIADA int
, IN_EDUCACAO_INDIGENA bool
);

create table matricula
(
NU_ANO_CENSO int
, ID_MATRICULA bigint
, CO_PESSOA_FISICA varchar(12)
, NU_DIA int
, NU_MES int
, NU_ANO int
, NU_IDADE_REFERENCIA int
, NU_IDADE int
, NU_DURACAO_TURMA int
, NU_DUR_ATIV_COMP_MESMA_REDE int
, NU_DUR_ATIV_COMP_OUTRAS_REDES int
, NU_DUR_AEE_MESMA_REDE int
, NU_DUR_AEE_OUTRAS_REDES int
, NU_DIAS_ATIVIDADE int
, TP_SEXO int
, TP_COR_RACA int
, TP_NACIONALIDADE int
, CO_PAIS_ORIGEM int
, CO_UF_NASC int
, CO_MUNICIPIO_NASC int
, CO_UF_END int
, CO_MUNICIPIO_END int
, TP_ZONA_RESIDENCIAL int
, TP_OUTRO_LOCAL_AULA int
, IN_TRANSPORTE_PUBLICO bool
, TP_RESPONSAVEL_TRANSPORTE int
, IN_TRANSP_VANS_KOMBI bool
, IN_TRANSP_MICRO_ONIBUS bool
, IN_TRANSP_ONIBUS bool
, IN_TRANSP_BICICLETA bool
, IN_TRANSP_TR_ANIMAL bool
, IN_TRANSP_OUTRO_VEICULO bool
, IN_TRANSP_EMBAR_ATE5 bool
, IN_TRANSP_EMBAR_5A15 bool
, IN_TRANSP_EMBAR_15A35 bool
, IN_TRANSP_EMBAR_35 bool
, IN_TRANSP_TREM_METRO bool
, IN_NECESSIDADE_ESPECIAL bool
, IN_CEGUEIRA bool
, IN_BAIXA_VISAO bool
, IN_SURDEZ bool
, IN_DEF_AUDITIVA bool
, IN_SURDOCEGUEIRA bool
, IN_DEF_FISICA bool
, IN_DEF_INTELECTUAL bool
, IN_DEF_MULTIPLA bool
, IN_AUTISMO bool
, IN_SINDROME_ASPERGER bool
, IN_SINDROME_RETT bool
, IN_TRANSTORNO_DI bool
, IN_SUPERDOTACAO bool
, IN_RECURSO_LEDOR bool
, IN_RECURSO_TRANSCRICAO bool
, IN_RECURSO_INTERPRETE bool
, IN_RECURSO_LIBRAS bool
, IN_RECURSO_LABIAL bool
, IN_RECURSO_BRAILLE bool
, IN_RECURSO_AMPLIADA_16 bool
, IN_RECURSO_AMPLIADA_20 bool
, IN_RECURSO_AMPLIADA_24 bool
, IN_RECURSO_NENHUM bool
, TP_INGRESSO_FEDERAIS int
, TP_MEDIACAO_DIDATICO_PEDAGO int
, IN_ESPECIAL_EXCLUSIVA bool
, IN_REGULAR bool
, IN_EJA bool
, IN_PROFISSIONALIZANTE bool
, TP_ETAPA_ENSINO int
, ID_TURMA int
, CO_CURSO_EDUC_PROFISSIONAL int
, TP_UNIFICADA int
, TP_TIPO_TURMA int
, CO_ENTIDADE int
, CO_REGIAO int
, CO_MESORREGIAO int
, CO_MICRORREGIAO int
, CO_UF int
, CO_MUNICIPIO int
, CO_DISTRITO int
, TP_DEPENDENCIA int
, TP_LOCALIZACAO int
, TP_CATEGORIA_ESCOLA_PRIVADA int
, IN_CONVENIADA_PP bool
, TP_CONVENIO_PODER_PUBLICO int
, IN_MANT_ESCOLA_PRIVADA_EMP bool
, IN_MANT_ESCOLA_PRIVADA_ONG bool
, IN_MANT_ESCOLA_PRIVADA_SIND bool
, IN_MANT_ESCOLA_PRIVADA_SIST_S bool
, IN_MANT_ESCOLA_PRIVADA_S_FINS bool
, TP_REGULAMENTACAO int
, TP_LOCALIZACAO_DIFERENCIADA int
, IN_EDUCACAO_INDIGENA bool
);

create table escola
(
NU_ANO_CENSO int
, CO_ENTIDADE int
, NO_ENTIDADE varchar(100)
, CO_ORGAO_REGIONAL varchar(5)
, TP_SITUACAO_FUNCIONAMENTO int
, DT_ANO_LETIVO_INICIO varchar(11)
, DT_ANO_LETIVO_TERMINO varchar(11)
, CO_REGIAO  int
, CO_MESORREGIAO int
, CO_MICRORREGIAO int
, CO_UF int
, CO_MUNICIPIO int
, CO_DISTRITO int
, TP_DEPENDENCIA int
, TP_LOCALIZACAO int
, TP_CATEGORIA_ESCOLA_PRIVADA int null
, IN_CONVENIADA_PP bool
, TP_CONVENIO_PODER_PUBLICO int null
, IN_MANT_ESCOLA_PRIVADA_EMP bool null
, IN_MANT_ESCOLA_PRIVADA_ONG bool null
, IN_MANT_ESCOLA_PRIVADA_SIND bool null
, IN_MANT_ESCOLA_PRIVADA_SIST_S bool null
, IN_MANT_ESCOLA_PRIVADA_S_FINS bool null
, CO_ESCOLA_SEDE_VINCULADA int null
, CO_IES_OFERTANTE int null
, TP_REGULAMENTACAO int null
, IN_LOCAL_FUNC_PREDIO_ESCOLAR int
, TP_OCUPACAO_PREDIO_ESCOLAR int
, IN_LOCAL_FUNC_SALAS_EMPRESA bool
, IN_LOCAL_FUNC_SOCIOEDUCATIVO bool
, IN_LOCAL_FUNC_UNID_PRISIONAL bool
, IN_LOCAL_FUNC_PRISIONAL_SOCIO bool
, IN_LOCAL_FUNC_TEMPLO_IGREJA bool
, IN_LOCAL_FUNC_CASA_PROFESSOR bool
, IN_LOCAL_FUNC_GALPAO bool
, TP_OCUPACAO_GALPAO int null
, IN_LOCAL_FUNC_SALAS_OUTRA_ESC bool
, IN_LOCAL_FUNC_OUTROS bool
, IN_PREDIO_COMPARTILHADO bool
, IN_AGUA_FILTRADA bool
, IN_AGUA_REDE_PUBLICA bool
, IN_AGUA_POCO_ARTESIANO bool
, IN_AGUA_CACIMBA bool
, IN_AGUA_FONTE_RIO bool
, IN_AGUA_INEXISTENTE bool
, IN_ENERGIA_REDE_PUBLICA bool
, IN_ENERGIA_GERADOR bool
, IN_ENERGIA_OUTROS bool
, IN_ENERGIA_INEXISTENTE bool
, IN_ESGOTO_REDE_PUBLICA bool
, IN_ESGOTO_FOSSA bool
, IN_ESGOTO_INEXISTENTE bool
, IN_LIXO_COLETA_PERIODICA bool
, IN_LIXO_QUEIMA bool
, IN_LIXO_JOGA_OUTRA_AREA bool
, IN_LIXO_RECICLA bool
, IN_LIXO_ENTERRA bool
, IN_LIXO_OUTROS bool
, IN_SALA_DIRETORIA bool
, IN_SALA_PROFESSOR bool
, IN_LABORATORIO_INFORMATICA bool
, IN_LABORATORIO_CIENCIAS bool
, IN_SALA_ATENDIMENTO_ESPECIAL bool
, IN_QUADRA_ESPORTES_COBERTA bool
, IN_QUADRA_ESPORTES_DESCOBERTA bool
, IN_QUADRA_ESPORTES bool
, IN_COZINHA bool
, IN_BIBLIOTECA bool
, IN_SALA_LEITURA bool
, IN_BIBLIOTECA_SALA_LEITURA bool
, IN_PARQUE_INFANTIL bool
, IN_BERCARIO bool
, IN_BANHEIRO_FORA_PREDIO bool
, IN_BANHEIRO_DENTRO_PREDIO bool
, IN_BANHEIRO_EI bool
, IN_BANHEIRO_PNE bool
, IN_DEPENDENCIAS_PNE bool
, IN_SECRETARIA bool
, IN_BANHEIRO_CHUVEIRO bool
, IN_REFEITORIO bool
, IN_DESPENSA bool
, IN_ALMOXARIFADO bool
, IN_AUDITORIO bool
, IN_PATIO_COBERTO bool
, IN_PATIO_DESCOBERTO bool
, IN_ALOJAM_ALUNO bool
, IN_ALOJAM_PROFESSOR bool
, IN_AREA_VERDE bool
, IN_LAVANDERIA bool
, IN_DEPENDENCIAS_OUTRAS bool
, NU_SALAS_EXISTENTES bool
, NU_SALAS_UTILIZADAS int
, IN_EQUIP_TV bool
, IN_EQUIP_VIDEOCASSETE bool
, IN_EQUIP_DVD bool
, IN_EQUIP_PARABOLICA bool
, IN_EQUIP_COPIADORA bool
, IN_EQUIP_RETROPROJETOR bool
, IN_EQUIP_IMPRESSORA bool
, IN_EQUIP_IMPRESSORA_MULT bool
, IN_EQUIP_SOM bool
, IN_EQUIP_MULTIMIDIA bool
, IN_EQUIP_FAX bool
, IN_EQUIP_FOTO bool
, IN_COMPUTADOR bool
, NU_EQUIP_TV int
, NU_EQUIP_VIDEOCASSETE int
, NU_EQUIP_DVD int
, NU_EQUIP_PARABOLICA int
, NU_EQUIP_COPIADORA int
, NU_EQUIP_RETROPROJETOR int
, NU_EQUIP_IMPRESSORA int
, NU_EQUIP_IMPRESSORA_MULT int
, NU_EQUIP_SOM int
, NU_EQUIP_MULTIMIDIA int
, NU_EQUIP_FAX int
, NU_EQUIP_FOTO int
, NU_COMPUTADOR int
, NU_COMP_ADMINISTRATIVO int
, NU_COMP_ALUNO int
, IN_INTERNET bool
, IN_BANDA_LARGA bool
, NU_FUNCIONARIOS int
, IN_ALIMENTACAO bool
, TP_AEE int
, TP_ATIVIDADE_COMPLEMENTAR int
, IN_FUNDAMENTAL_CICLOS bool
, TP_LOCALIZACAO_DIFERENCIADA int
, IN_MATERIAL_ESP_QUILOMBOLA bool
, IN_MATERIAL_ESP_INDIGENA bool
, IN_MATERIAL_ESP_NAO_UTILIZA bool
, IN_EDUCACAO_INDIGENA bool
, TP_INDIGENA_LINGUA int
, CO_LINGUA_INDIGENA int
, IN_BRASIL_ALFABETIZADO bool
, IN_FINAL_SEMANA bool
, IN_FORMACAO_ALTERNANCIA bool
, IN_MEDIACAO_PRESENCIAL bool
, IN_MEDIACAO_SEMIPRESENCIAL bool
, IN_MEDIACAO_EAD bool
, IN_ESPECIAL_EXCLUSIVA bool
, IN_REGULAR bool
, IN_EJA bool
, IN_PROFISSIONALIZANTE bool
, IN_COMUM_CRECHE bool
, IN_COMUM_PRE bool
, IN_COMUM_FUND_AI bool
, IN_COMUM_FUND_AF bool
, IN_COMUM_MEDIO_MEDIO bool
, IN_COMUM_MEDIO_INTEGRADO bool
, IN_COMUM_MEDIO_NORMAL bool
, IN_ESP_EXCLUSIVA_CRECHE bool
, IN_ESP_EXCLUSIVA_PRE bool
, IN_ESP_EXCLUSIVA_FUND_AI bool
, IN_ESP_EXCLUSIVA_FUND_AF bool
, IN_ESP_EXCLUSIVA_MEDIO_MEDIO bool
, IN_ESP_EXCLUSIVA_MEDIO_INTEGR bool
, IN_ESP_EXCLUSIVA_MEDIO_NORMAL bool
, IN_COMUM_EJA_FUND bool
, IN_COMUM_EJA_MEDIO bool
, IN_COMUM_EJA_PROF bool
, IN_ESP_EXCLUSIVA_EJA_FUND bool
, IN_ESP_EXCLUSIVA_EJA_MEDIO bool
, IN_ESP_EXCLUSIVA_EJA_PROF bool
, IN_COMUM_PROF bool
, IN_ESP_EXCLUSIVA_PROF bool
);

create table docente
(
NU_ANO_CENSO int
, CO_PESSOA_FISICA bigint
, NU_DIA int
, NU_MES int
, NU_ANO int
, NU_IDADE_REFERENCIA int
, NU_IDADE int
, TP_SEXO int
, TP_COR_RACA int
, TP_NACIONALIDADE int
, CO_PAIS_ORIGEM int
, CO_UF_NASC int
, CO_MUNICIPIO_NASC int
, CO_UF_END int
, CO_MUNICIPIO_END int
, TP_ZONA_RESIDENCIAL int
, IN_NECESSIDADE_ESPECIAL bool
, IN_CEGUEIRA bool
, IN_BAIXA_VISAO bool
, IN_SURDEZ bool
, IN_DEF_AUDITIVA bool
, IN_SURDOCEGUEIRA bool
, IN_DEF_FISICA bool
, IN_DEF_INTELECTUAL bool
, IN_DEF_MULTIPLA bool
, TP_ESCOLARIDADE int
, TP_NORMAL_MAGISTERIO int
, TP_SITUACAO_CURSO_1 int
, CO_AREA_CURSO_1 int
, CO_CURSO_1 int
, IN_LICENCIATURA_1 bool
, IN_COM_PEDAGOGICA_1 bool
, NU_ANO_INICIO_1 int
, NU_ANO_CONCLUSAO_1 int
, TP_TIPO_IES_1 int
, CO_IES_1 int
, TP_SITUACAO_CURSO_2 int
, CO_AREA_CURSO_2 int
, CO_CURSO_2 int
, IN_LICENCIATURA_2 bool
, IN_COM_PEDAGOGICA_2 bool
, NU_ANO_INICIO_2 int
, NU_ANO_CONCLUSAO_2 int
, TP_TIPO_IES_2 int
, CO_IES_2 int
, TP_SITUACAO_CURSO_3 int
, CO_AREA_CURSO_3 int
, CO_CURSO_3 int
, IN_LICENCIATURA_3 bool
, IN_COM_PEDAGOGICA_3 bool
, NU_ANO_INICIO_3 int
, NU_ANO_CONCLUSAO_3 int
, TP_TIPO_IES_3 int
, CO_IES_3 int
, IN_DISC_QUIMICA bool
, IN_DISC_FISICA bool
, IN_DISC_MATEMATICA bool
, IN_DISC_BIOLOGIA bool
, IN_DISC_CIENCIAS bool
, IN_DISC_LINGUA_PORTUGUESA bool
, IN_DISC_LINGUA_INGLES bool
, IN_DISC_LINGUA_ESPANHOL bool
, IN_DISC_LINGUA_FRANCES bool
, IN_DISC_LINGUA_OUTRA bool
, IN_DISC_LINGUA_INDIGENA bool
, IN_DISC_ARTES bool
, IN_DISC_EDUCACAO_FISICA bool
, IN_DISC_HISTORIA bool
, IN_DISC_GEOGRAFIA bool
, IN_DISC_FILOSOFIA bool
, IN_DISC_ENSINO_RELIGIOSO bool
, IN_DISC_ESTUDOS_SOCIAIS bool
, IN_DISC_SOCIOLOGIA bool
, IN_DISC_EST_SOCIAIS_SOCIOLOGIA bool
, IN_DISC_INFORMATICA_COMPUTACAO bool
, IN_DISC_PROFISSIONALIZANTE bool
, IN_DISC_ATENDIMENTO_ESPECIAIS bool
, IN_DISC_DIVER_SOCIO_CULTURAL bool
, IN_DISC_LIBRAS bool
, IN_DISC_PEDAGOGICAS bool
, IN_DISC_OUTRAS bool
, IN_ESPECIALIZACAO bool
, IN_MESTRADO bool
, IN_DOUTORADO bool
, IN_POS_NENHUM bool
, IN_ESPECIFICO_CRECHE bool
, IN_ESPECIFICO_PRE_ESCOLA bool
, IN_ESPECIFICO_ANOS_INICIAIS bool
, IN_ESPECIFICO_ANOS_FINAIS bool
, IN_ESPECIFICO_ENS_MEDIO bool
, IN_ESPECIFICO_EJA bool
, IN_ESPECIFICO_ED_ESPECIAL bool
, IN_ESPECIFICO_ED_INDIGENA bool
, IN_ESPECIFICO_CAMPO bool
, IN_ESPECIFICO_AMBIENTAL bool
, IN_ESPECIFICO_DIR_HUMANOS bool
, IN_ESPECIFICO_DIV_SEXUAL bool
, IN_ESPECIFICO_DIR_ADOLESC bool
, IN_ESPECIFICO_AFRO bool
, IN_ESPECIFICO_OUTROS bool
, IN_ESPECIFICO_NENHUM bool
, TP_TIPO_DOCENTE int
, TP_TIPO_CONTRATACAO int
, ID_TURMA int
, TP_TIPO_TURMA int
, TP_MEDIACAO_DIDATICO_PEDAGO int
, IN_ESPECIAL_EXCLUSIVA bool
, IN_REGULAR bool
, IN_EJA bool
, IN_PROFISSIONALIZANTE bool
, TP_ETAPA_ENSINO int
, CO_CURSO_EDUC_PROFISSIONAL int
, CO_REGIAO int
, CO_MESORREGIAO int
, CO_MICRORREGIAO int
, CO_ENTIDADE int
, CO_UF int
, CO_MUNICIPIO int
, CO_DISTRITO int
, TP_DEPENDENCIA int
, TP_LOCALIZACAO int
, TP_CATEGORIA_ESCOLA_PRIVADA int
, IN_CONVENIADA_PP bool
, TP_CONVENIO_PODER_PUBLICO int
, IN_MANT_ESCOLA_PRIVADA_EMP bool
, IN_MANT_ESCOLA_PRIVADA_ONG bool
, IN_MANT_ESCOLA_PRIVADA_SIND bool
, IN_MANT_ESCOLA_PRIVADA_SIST_S bool
, IN_MANT_ESCOLA_PRIVADA_S_FINS bool
, TP_REGULAMENTACAO int
, TP_LOCALIZACAO_DIFERENCIADA int
, IN_EDUCACAO_INDIGENA bool
);

CREATE TABLE etapas_ensino (
    id_etapa INT PRIMARY KEY,
    nome_etapa VARCHAR(255) NOT NULL
);

create table usuario (
	ID int auto_increment,
    NOME varchar(255) not null,
    DATA_NASCIMENTO date,
    EMAIL varchar(255),
    DATA_CADASTRO datetime DEFAULT CURRENT_TIMESTAMP,
    IDADE smallint,
    SENHA varchar(40),-- default (sha('senha')),
    
    primary key(ID),
    unique(EMAIL)
);

create table bookmark (
	ID int auto_increment,
    ID_USUARIO int not null,
    ID_ESCOLA int not null,
    
    primary key(ID)
);

-- Imports

SET sql_mode = "";
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\Docentes Rio Claro 2017.csv'
-- load data infile '/var/lib/mysql-files/Docentes Rio Claro 2017.csv'
into table labbd.docente
fields terminated by '|'
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
;

SET sql_mode = "";
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\Matriculas Rio Claro 2017.csv'
-- load data infile '/var/lib/mysql-files/Matriculas Rio Claro 2017.csv'
into table labbd.matricula
fields terminated by '|'
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\Turmas Rio Claro 2017.csv'
-- load data infile '/var/lib/mysql-files/Turmas Rio Claro 2017.csv'
into table labbd.turma
fields terminated by '|'
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\Escolas Rio Claro 2017.csv'
-- load data infile '/var/lib/mysql-files/Escolas Rio Claro 2017.csv'
into table labbd.escola
fields terminated by '|'
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
;

INSERT INTO etapas_ensino (id_etapa, nome_etapa) VALUES
(1, 'Educação Infantil - Creche'),
(2, 'Educação Infantil - Pré-escola'),
(4, 'Ensino Fundamental de 8 anos - 1ª Série'),
(5, 'Ensino Fundamental de 8 anos - 2ª Série'),
(6, 'Ensino Fundamental de 8 anos - 3ª Série'),
(7, 'Ensino Fundamental de 8 anos - 4ª Série'),
(8, 'Ensino Fundamental de 8 anos - 5ª Série'),
(9, 'Ensino Fundamental de 8 anos - 6ª Série'),
(10, 'Ensino Fundamental de 8 anos - 7ª Série'),
(11, 'Ensino Fundamental de 8 anos - 8ª Série'),
(14, 'Ensino Fundamental de 9 anos - 1º Ano'),
(15, 'Ensino Fundamental de 9 anos - 2º Ano'),
(16, 'Ensino Fundamental de 9 anos - 3º Ano'),
(17, 'Ensino Fundamental de 9 anos - 4º Ano'),
(18, 'Ensino Fundamental de 9 anos - 5º Ano'),
(19, 'Ensino Fundamental de 9 anos - 6º Ano'),
(20, 'Ensino Fundamental de 9 anos - 7º Ano'),
(21, 'Ensino Fundamental de 9 anos - 8º Ano'),
(41, 'Ensino Fundamental de 9 anos - 9º Ano'),
(25, 'Ensino Médio - 1ª Série'),
(26, 'Ensino Médio - 2ª Série'),
(27, 'Ensino Médio - 3ª Série'),
(28, 'Ensino Médio - 4ª Série'),
(29, 'Ensino Médio - Não Seriada'),
(30, 'Curso Técnico Integrado (Ensino Médio Integrado) 1ª Série'),
(31, 'Curso Técnico Integrado (Ensino Médio Integrado) 2ª Série'),
(32, 'Curso Técnico Integrado (Ensino Médio Integrado) 3ª Série'),
(33, 'Curso Técnico Integrado (Ensino Médio Integrado) 4ª Série'),
(34, 'Curso Técnico Integrado (Ensino Médio Integrado) Não Seriada'),
(35, 'Ensino Médio - Normal/Magistério 1ª Série'),
(36, 'Ensino Médio - Normal/Magistério 2ª Série'),
(37, 'Ensino Médio - Normal/Magistério 3ª Série'),
(38, 'Ensino Médio - Normal/Magistério 4ª Série'),
(39, 'Curso Técnico - Concomitante'),
(40, 'Curso Técnico - Subsequente'),
(68, 'Curso FIC Concomitante'),
(65, 'EJA - Ensino Fundamental - Projovem Urbano'),
(67, 'Curso FIC integrado na modalidade EJA - Nível Médio'),
(69, 'EJA - Ensino Fundamental - Anos iniciais'),
(70, 'EJA - Ensino Fundamental - Anos finais'),
(71, 'EJA - Ensino Médio'),
(72, 'EJA - Ensino Fundamental - Anos iniciais e Anos finais'),
(73, 'Curso FIC integrado na modalidade EJA - Nível Fundamental (EJA integrada à Educação Profissional de Nível Fundamental)'),
(74, 'Curso Técnico Integrado na Modalidade EJA (EJA integrada à Educação Profissional de Nível Médio)');

-- Constraints

alter table escola add constraint primary key (CO_ENTIDADE);
alter table turma add constraint primary key (ID_TURMA);
alter table docente add constraint primary key (CO_PESSOA_FISICA, ID_TURMA);
alter table matricula add constraint primary key (ID_MATRICULA);
 
alter table matricula add constraint FK_MATRICULA_ESCOLA foreign key (CO_ENTIDADE) references escola(CO_ENTIDADE);
alter table docente add constraint FK_DOCENTE_ESCOLA foreign key (CO_ENTIDADE) references escola(CO_ENTIDADE);
alter table turma add constraint FK_TURMA_ESCOLA foreign key (CO_ENTIDADE) references escola(CO_ENTIDADE);

alter table matricula add constraint FK_MATRICULA_TURMA foreign key (ID_TURMA) references turma(ID_TURMA);
alter table docente add constraint FK_DOCENTE_TURMA foreign key (ID_TURMA) references turma(ID_TURMA);

alter table bookmark add constraint FK_BOOKMARK_USUARIO foreign key (ID_USUARIO) references usuario(ID);
alter table bookmark add constraint FK_BOOKMARK_ESCOLA foreign key (ID_ESCOLA) references escola(CO_ENTIDADE);

-- Views

CREATE VIEW v_turma AS
SELECT 
	ID_TURMA AS codigo,
    CO_ENTIDADE AS codigo_escola,
    NO_TURMA AS nome,
    NU_MATRICULAS AS numero_matriculas,
    TP_ETAPA_ENSINO AS etapa_de_ensino,
    CASE WHEN IN_DISC_QUIMICA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_quimica,
	CASE WHEN IN_DISC_FISICA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_fisica,
	CASE WHEN IN_DISC_MATEMATICA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_matematica,
	CASE WHEN IN_DISC_BIOLOGIA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_biologia,
	CASE WHEN IN_DISC_CIENCIAS = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_ciencias,
	CASE WHEN IN_DISC_LINGUA_PORTUGUESA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_lingua_portuguesa,
	CASE WHEN IN_DISC_LINGUA_INGLES = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_lingua_ingles,
	CASE WHEN IN_DISC_LINGUA_ESPANHOL = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_lingua_espanhol,
	CASE WHEN IN_DISC_LINGUA_FRANCES = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_lingua_frances,
	CASE WHEN IN_DISC_LINGUA_OUTRA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_lingua_outra,
	CASE WHEN IN_DISC_LINGUA_INDIGENA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_lingua_indigena,
	CASE WHEN IN_DISC_ARTES = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_artes,
	CASE WHEN IN_DISC_EDUCACAO_FISICA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_educacao_fisica,
	CASE WHEN IN_DISC_HISTORIA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_historia,
	CASE WHEN IN_DISC_GEOGRAFIA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_geografia,
	CASE WHEN IN_DISC_FILOSOFIA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_filosofia,
	CASE WHEN IN_DISC_ENSINO_RELIGIOSO = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_ensino_religioso,
	CASE WHEN IN_DISC_ESTUDOS_SOCIAIS = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_estudos_sociais,
	CASE WHEN IN_DISC_SOCIOLOGIA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_sociologia,
	CASE WHEN IN_DISC_EST_SOCIAIS_SOCIOLOGIA = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_est_sociais_sociologia,
	CASE WHEN IN_DISC_INFORMATICA_COMPUTACAO = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_informatica_computacao,
	CASE WHEN IN_DISC_PROFISSIONALIZANTE = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_profissionalizante,
	CASE WHEN IN_DISC_ATENDIMENTO_ESPECIAIS = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_atendimento_especiais,
	CASE WHEN IN_DISC_DIVER_SOCIO_CULTURAL = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_diver_socio_cultural,
	CASE WHEN IN_DISC_LIBRAS = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_libras, 
	CASE WHEN IN_DISC_PEDAGOGICAS = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_pedagogicas,
	CASE WHEN IN_DISC_OUTRAS = 1 THEN 'Sim' ELSE 'Não' END AS disciplina_outras
FROM 
    turma;
    
CREATE VIEW v_matricula AS
SELECT 
    ID_MATRICULA AS codigo,
    CO_PESSOA_FISICA AS codigo_aluno,
    CO_ENTIDADE AS codigo_escola,
    TP_ETAPA_ENSINO AS etapa_de_ensino
FROM 
    matricula;
    
CREATE VIEW v_escola AS
SELECT 
    CO_ENTIDADE AS codigo,
    NO_ENTIDADE AS nome,
    CASE 
        WHEN TP_SITUACAO_FUNCIONAMENTO = 1 THEN 'Em Atividade'
        WHEN TP_SITUACAO_FUNCIONAMENTO = 2 THEN 'Paralisada'
        WHEN TP_SITUACAO_FUNCIONAMENTO = 3 THEN 'Extinta'
        WHEN TP_SITUACAO_FUNCIONAMENTO = 4 THEN 'Extinta em Anos Anteriores'
        ELSE 'Situação Desconhecida'
    END AS situacao
FROM 
    escola;
    
CREATE VIEW v_docente AS
SELECT 
    CO_PESSOA_FISICA AS codigo,
    CO_ENTIDADE AS codigo_escola,
    CASE 
        WHEN TP_TIPO_DOCENTE = 1 THEN 'Docente'
        WHEN TP_TIPO_DOCENTE = 2 THEN 'Auxiliar/Assistente Educacional'
        WHEN TP_TIPO_DOCENTE = 3 THEN 'Profissional/Monitor de atividade complementar'
        WHEN TP_TIPO_DOCENTE = 4 THEN 'Tradutor Intérprete de Libras'
        WHEN TP_TIPO_DOCENTE = 5 THEN 'Docente Titular - coordenador de tutoria (de módulo ou disciplina) - EAD'
        WHEN TP_TIPO_DOCENTE = 6 THEN 'Docente Tutor - Auxiliar (de módulo ou disciplina) - EAD'
        ELSE 'Função Desconhecida'
    END AS funcao,
    CASE
        WHEN TP_TIPO_CONTRATACAO = 1 THEN 'Concursado/efetivo/estável'
        WHEN TP_TIPO_CONTRATACAO = 2 THEN 'Contrato temporário'
        WHEN TP_TIPO_CONTRATACAO = 3 THEN 'Contrato terceirizado'
        WHEN TP_TIPO_CONTRATACAO = 4 THEN 'Contrato CLT'
        ELSE 'Tipo de Contrato Desconhecido'
    END AS contrato
FROM 
    docente;
