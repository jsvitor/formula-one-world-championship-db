/*==============================================================*/
/* Table: TB_CIRCUITO                                           */
/*==============================================================*/
create table TB_CIRCUITO (
   ID_CIRCUITO INTEGER not null,
   NOME_CIRCUITO VARCHAR2(100) not null,
   LOCALIDADE_CIRCUITO VARCHAR2(30) not null,
   PAIS_CIRCUITO VARCHAR2(30) not null,
   constraint PK_TB_CIRCUITO primary key (ID_CIRCUITO)
);
​
/*==============================================================*/
/* Table: TB_CONSTRUTORES                                       */
/*==============================================================*/
create table TB_CONSTRUTORES (
   ID_CONSTRUTOR INTEGER not null,
   NOME_CONSTRUTOR VARCHAR2(100) not null,
   NACIONALIDADE_CONSTRUTOR VARCHAR2(30) not null,
   constraint PK_TB_CONSTRUTORES primary key (ID_CONSTRUTOR)
);
​
/*==============================================================*/
/* Table: TB_PILOTOS                                            */
/*==============================================================*/
create table TB_PILOTOS (
   ID_PILOTO INTEGER not null,
   ID_CONSTRUTOR INTEGER not null,
   NUMERO_PILOTO VARCHAR2(10) not null,
   CODIGO_PILOTO CHAR(3) not null,
   NOME_PILOTO VARCHAR2(30) not null,
   SOBRENOME_PILOTO VARCHAR2(30) not null,
   ANIVERSARIO_PILOTO DATE not null,
   NACIONALIDADE_PILOTO VARCHAR2(30) not null,
   constraint PK_TB_PILOTOS primary key (ID_PILOTO)
);
​
/*==============================================================*/
/* Table: TB_STATUS                                             */
/*==============================================================*/
create table TB_STATUS (
   ID_STATUS INTEGER not null,
   STATUS VARCHAR2(100) not null,
   constraint PK_TB_STATUS primary key (ID_STATUS)
);
​
/*==============================================================*/
/* Table: TB_TEMPORADA                                          */
/*==============================================================*/
create table TB_TEMPORADA (
   ID_TEMPORADA INTEGER not null
   ANO_TEMPORADA INTEGER not null,
   constraint PK_TB_TEMPORADA primary key (ID_TEMPORADA)
);
​
/*==============================================================*/
/* Table: TB_GRANDE_PREMIO                                      */
/*==============================================================*/
create table TB_GRANDE_PREMIO (
   ID_GRANDEPREMIO INTEGER not null,
   ID_CIRCUITO INTEGER not null,
   ID_TEMPORADA INTEGER not null,
   RODADA INTEGER not null,
   NM_GRANDE_PREMIO VARCHAR2(100) not null,
   DT_GRANDE_PREMIO DATE not null,
   constraint PK_TB_GRANDE_PREMIO primary key (ID_GRANDEPREMIO)
);
​
/*==============================================================*/
/* Table: TB_RESULTADO                                          */
/*==============================================================*/
create table TB_RESULTADO (
   ID_RESULTADOS INTEGER not null,
   ID_GRANDEPREMIO INTEGER not null,
   ID_STATUS INTEGER not null,
   ID_PILOTO INTEGER not null,
   NUMERO INTEGER not null,
   GRID INTEGER not null,
   POSICAO VARCHAR2(25) not null,
   ORDEM_CLASSIFICACAO INTEGER not null,
   PONTOS INTEGER not null,
   VOLTAS INTEGER not null,
   TEMPO VARCHAR2(25) not null,
   MILISEGUNDOS VARCHAR2(25) not null,
   MENOR_TEMPO VARCHAR2(25) not null,
   RANKING VARCHAR2(25) not null,
   TEMPO_VOLTA_MAIS_RAPIDA VARCHAR2(25) not null,
   VELOCIDADE_VOLTA_MAIS_RAPIDA VARCHAR2(25) not null,
   constraint PK_TB_RESULTADO primary key (ID_RESULTADOS)
);
​
/*==============================================================*/
/* Table: TB_RESULTADO_CONSTRUTORES                             */
/*==============================================================*/
create table TB_RESULTADO_CONSTRUTORES (
   ID_RESULTADO_CONSTRUTORES INTEGER not null,
   ID_RESULTADOS INTEGER not null,
   ID_CONSTRUTOR INTEGER not null,
   PONTOS_RESULTADO_CONSTRUTOR INTEGER not null,
   constraint PK_TB_RESULTADO_CONSTRUTORES primary key (ID_RESULTADO_CONSTRUTORES)
);
​
/*==============================================================*/
/* Table: TB_CLASSIFICACAO_CONSTRUTORES                         */
/*==============================================================*/
create table TB_CLASSIFICACAO_CONSTRUTORES (
   ID_CLASSIFICACAO_CONSTRUTORES INTEGER not null,
   ID_RESULTADO_CONSTRUTORES INTEGER not null,
   ID_CONSTRUTOR INTEGER not null,
   PONTOS_CLASSIFICACAO_CONSTRUTORES CHAR(10) not null,
   POSICAO_CLASSIFICACAO_CONSTRUTORES CHAR(10) not null,
   VITORIAS_CLASSIFICACAO_CONSTRUTORES CHAR(10) not null,
   constraint PK_TB_CLASSIFICACAO_CONSTRUTORES primary key (ID_CLASSIFICACAO_CONSTRUTORES)
);
​
/*==============================================================*/
/* Table: TB_CLASSIFICACAO_PILOTOS                              */
/*==============================================================*/
create table TB_CLASSIFICACAO_PILOTOS (
   ID_CLASSIFICACAO_PILOTOS INTEGER not null,
   ID_RESULTADOS INTEGER not null,
   ID_PILOTO INTEGER not null,
   PONTOS_PILOTO INTEGER not null,
   POSICAO_PILOTO INTEGER not null,
   VITORIAS_PILOTO INTEGER not null,
   constraint PK_TB_CLASSIFICACAO_PILOTOS primary key (ID_CLASSIFICACAO_PILOTOS)
);
​
/*==============================================================*/
/* Table: TB_PITSTOP                                            */
/*==============================================================*/
create table TB_PITSTOP (
   ID_PILOTO INTEGER not null,
   ID_RESULTADOS INTEGER not null,
   PARADA INTEGER not null,
   VOLTA INTEGER not null,
   HORA_PARADA TIMESTAMP not null,
   DURACAO_PARADA CHAR(6) not null,
   MILISEGUNDOS_DE_PARADA INTEGER not null
);
​
/*==============================================================*/
/* Table: TB_TEMPO_DA_VOLTA                                     */
/*==============================================================*/
create table TB_TEMPO_DA_VOLTA (
   ID_PILOTO INTEGER not null,
   ID_RESULTADOS INTEGER not null,
   NUMERO_VOLTA INTEGER not null,
   POSICAO_VOLTA INTEGER not null,
   TEMPO_VOLTA CHAR(20) not null,
   MILISEGUNDO_VOLTA INTEGER not null
);
​
/*==============================================================*/
/* Table: TB_TREINO_CLASSIFICATORIO                             */
/*==============================================================*/
create table TB_TREINO_CLASSIFICATORIO (
   ID_TREINO_CLASSIFICATORIO INTEGER not null,
   ID_GRANDEPREMIO INTEGER not null,
   ID_PILOTO INTEGER not null,
   ID_CONSTRUTOR INTEGER not null,
   NUMERO_CARRO INTEGER not null,
   POSICAO_FINAL VARCHAR2(2) not null,
   Q1 TIMESTAMP not null,
   Q2 TIMESTAMP not null,
   Q3 TIMESTAMP not null,
   constraint PK_TB_TREINO_CLASSIFICATORIO primary key (ID_TREINO_CLASSIFICATORIO)
);
​
/*==============================================================*/
/* Constraints: FOREIGN_KEYS                                    */
/*==============================================================*/
alter table TB_CLASSIFICACAO_CONSTRUTORES
   add constraint FK_TB_CLS_CONSTRUTORES_REF_TB_RES_CONSTRUTORES foreign key (ID_RESULTADO_CONSTRUTORES)
      references TB_RESULTADO_CONSTRUTORES (ID_RESULTADO_CONSTRUTORES);
​
alter table TB_CLASSIFICACAO_CONSTRUTORES
add constraint FK_TB_CLS_CONSTRUTORES_REF_TB_CONSTRUTORES foreign key (ID_CONSTRUTOR)
references TB_CONSTRUTORES (ID_CONSTRUTOR);
​
alter table TB_CLASSIFICACAO_PILOTOS
add constraint FK_TB_CLS_PILOTOS_REF_TB_PILOTOS foreign key (ID_PILOTO)
references TB_PILOTOS (ID_PILOTO);
​
alter table TB_CLASSIFICACAO_PILOTOS
add constraint FK_TB_CLS_PILOTOS_REF_TB_RESULTADO foreign key (ID_RESULTADOS)
references TB_RESULTADO (ID_RESULTADOS);
​
alter table TB_GRANDE_PREMIO
add constraint FK_TB_GRANDE_PREMIO_REF_TB_TEMPORADA foreign key (ID_TEMPORADA)
references TB_TEMPORADA (ID_TEMPORADA);
​
alter table TB_GRANDE_PREMIO
add constraint FK_TB_GRANDE_PREMIO_REF_TB_CIRCUITO foreign key (ID_CIRCUITO)
references TB_CIRCUITO (ID_CIRCUITO);
​
alter table TB_PILOTOS
add constraint FK_TB_PILOTOS_REF_TB_CONSTRUTORES foreign key (ID_CONSTRUTOR)
references TB_CONSTRUTORES (ID_CONSTRUTOR);
​
alter table TB_PITSTOP
add constraint FK_TB_PITSTOP_REF_TB_PILOTOS foreign key (ID_PILOTO)
references TB_PILOTOS (ID_PILOTO);
​
alter table TB_PITSTOP
add constraint FK_TB_PITSTOP_REF_TB_RESULTADO foreign key (ID_RESULTADOS)
references TB_RESULTADO (ID_RESULTADOS);
​
alter table TB_RESULTADO
add constraint FK_TB_RESULTADO_REF_TB_PILOTOS foreign key (ID_PILOTO)
references TB_PILOTOS (ID_PILOTO);
​
alter table TB_RESULTADO
add constraint FK_TB_RESULTADO_REF_TB_GRANDE_PREMIO foreign key (ID_GRANDEPREMIO)
references TB_GRANDE_PREMIO (ID_GRANDEPREMIO);
​
alter table TB_RESULTADO
add constraint FK_TB_RESULTADO_REF_TB_STATUS foreign key (ID_STATUS)
references TB_STATUS (ID_STATUS);
​
alter table TB_RESULTADO_CONSTRUTORES
add constraint FK_TB_RES_CONSTRUTORES_REF_TB_RESULTADO foreign key (ID_RESULTADOS)
references TB_RESULTADO (ID_RESULTADOS);
​
alter table TB_RESULTADO_CONSTRUTORES
add constraint FK_TB_RES_CONSTRUTORES_REF_TB_CONSTRUTORES foreign key (ID_CONSTRUTOR)
references TB_CONSTRUTORES (ID_CONSTRUTOR);
​
alter table TB_TEMPO_DA_VOLTA
add constraint FK_TB_TEMPO_VOLTA_REF_TB_RESULTADO foreign key (ID_RESULTADOS)
references TB_RESULTADO (ID_RESULTADOS);
​
alter table TB_TEMPO_DA_VOLTA
add constraint FK_TB_TEMPO_VOLTA_REF_TB_PILOTOS foreign key (ID_PILOTO)
references TB_PILOTOS (ID_PILOTO);
​
alter table TB_TREINO_CLASSIFICATORIO
add constraint FK_TB_TREINO_REF_TB_PILOTOS foreign key (ID_PILOTO)
references TB_PILOTOS (ID_PILOTO);
​
alter table TB_TREINO_CLASSIFICATORIO
add constraint FK_TB_TREINO_REF_TB_CONSTRUTORES foreign key (ID_CONSTRUTOR)
references TB_CONSTRUTORES (ID_CONSTRUTOR);
​
alter table TB_TREINO_CLASSIFICATORIO
add constraint FK_TB_TREINO_REF_TB_GRANDE_PREMIO foreign key (ID_GRANDEPREMIO)
references TB_GRANDE_PREMIO (ID_GRANDEPREMIO);