use labbd;
# drop table escola; 
# CO_MUNICIPIO=3543907
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