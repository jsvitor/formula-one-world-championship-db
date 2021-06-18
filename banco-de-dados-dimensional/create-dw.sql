

/*==============================================================*/
/* Table: DIM_CONSTRUTOR                                        */
/*==============================================================*/
create table DIM_CONSTRUTOR (
   ID_CONSTRUTOR        INTEGER               not null,
   NM_CONSTRUTOR        VARCHAR2(30),
   NACIONALIDADE        VARCHAR2(30),
   constraint PK_DIM_CONSTRUTOR primary key (ID_CONSTRUTOR)
);

/*==============================================================*/
/* Table: DIM_DATA                                              */
/*==============================================================*/
create table DIM_DATA (
   ID_DATA              INTEGER               not null,
   constraint PK_DIM_DATA primary key (ID_DATA)
);

/*==============================================================*/
/* Table: DIM_GRANDE_PREMIO                                     */
/*==============================================================*/
create table DIM_GRANDE_PREMIO (
   ID_GRANDE_PREMIO     INTEGER               not null,
   ANO_TEMPORADA        INTEGER               not null,
   NM_GRANDE_PREMIO     VARCHAR2(100)         not null,
   DT_GRANDE_PREMIO     DATE                  not null,
   NM_CIRCUITO          VARCHAR2(100)         not null,
   LOCALIDADE_CIRCUITO  VARCHAR2(50)          not null,
   PAIS_CIRCUITO        VARCHAR2(50)          not null,
   constraint PK_DIM_GRANDE_PREMIO primary key (ID_GRANDE_PREMIO)
);

/*==============================================================*/
/* Table: DIM_PILOTO                                            */
/*==============================================================*/
create table DIM_PILOTO (
   ID_PILOTO            INTEGER               not null,
   NM_PILOTO            VARCHAR2(50),
   NU_PILOTO            INTEGER,
   NACIONALIDADE        VARCHAR2(30),
   constraint PK_DIM_PILOTO primary key (ID_PILOTO)
);

/*==============================================================*/
/* Table: DIM_STATUS                                            */
/*==============================================================*/
create table DIM_STATUS (
   ID_STATUS            INTEGER               not null,
   STATUS               VARCHAR2(50)          not null,
   constraint PK_DIM_STATUS primary key (ID_STATUS)
);

/*==============================================================*/
/* Table: FT_RESULTADOS                                         */
/*==============================================================*/
create table FT_RESULTADOS (
   SK_CONSTRUTOR        INTEGER               not null,
   SK_PILOTO            INTEGER               not null,
   SK_GRANDE_PREMIO     INTEGER               not null,
   SK_DATA              INTEGER               not null,
   SK_STATUS            INTEGER               not null,
   POSICAO_TREINO       INTEGER               not null,
   POSICAO_GP           VARCHAR2(2)           not null,
   PTS_PILOTO           INTEGER               not null,
   constraint PK_FT_RESULTADOS primary key ()
);

alter table FT_RESULTADOS
   add constraint FK_FT_RESUL_REFERENCE_DIM_CONS foreign key (SK_CONSTRUTOR)
      references DIM_CONSTRUTOR (ID_CONSTRUTOR);

alter table FT_RESULTADOS
   add constraint FK_FT_RESUL_REFERENCE_DIM_PILO foreign key (SK_PILOTO)
      references DIM_PILOTO (ID_PILOTO);

alter table FT_RESULTADOS
   add constraint FK_FT_RESUL_REFERENCE_DIM_GRAN foreign key (SK_GRANDE_PREMIO)
      references DIM_GRANDE_PREMIO (ID_GRANDE_PREMIO);

alter table FT_RESULTADOS
   add constraint FK_FT_RESUL_REFERENCE_DIM_DATA foreign key (SK_DATA)
      references DIM_DATA (ID_DATA);

alter table FT_RESULTADOS
   add constraint FK_FT_RESUL_REFERENCE_DIM_STAT foreign key (SK_STATUS)
      references DIM_STATUS (ID_STATUS);
