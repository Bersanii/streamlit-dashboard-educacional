use labbd;
# drop table turma;
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