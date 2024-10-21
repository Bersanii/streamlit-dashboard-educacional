use labbd;
# drop table turma;
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