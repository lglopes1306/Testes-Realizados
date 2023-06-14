--------------------------------------------------------
--  Arquivo criado - quarta-feira-outubro-19-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MUSICA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MUSICA" 
   (	"IDMUSICA" NUMBER(*,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NOME" VARCHAR2(60 BYTE), 
	"DT_INSCRICAO" DATE, 
	"NACIONALIDADE" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MUSICA_AUTOR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MUSICA_AUTOR" 
   (	"ID" NUMBER(*,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"IDMUSICA" NUMBER(*,0), 
	"IDAUTOR" NUMBER(*,0), 
	"PERCENTUAL" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AUTOR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AUTOR" 
   (	"IDAUTOR" NUMBER(*,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NOME" VARCHAR2(60 BYTE), 
	"NOME_ARTISTICO" VARCHAR2(60 BYTE), 
	"CPF" VARCHAR2(15 BYTE), 
	"RG" VARCHAR2(15 BYTE), 
	"BANCO" VARCHAR2(30 BYTE), 
	"AGENCIA" VARCHAR2(10 BYTE), 
	"CONTA" VARCHAR2(15 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EXEC_MUSICA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."EXEC_MUSICA" 
   (	"IDEXEC_MUSICA" NUMBER(*,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"IDMUSICA" NUMBER(*,0), 
	"DT_TOCOU" DATE, 
	"QTDE" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PAGAMENTO_PROCESSADO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PAGAMENTO_PROCESSADO" 
   (	"IDPAGAMENTO_PROCESSADO" NUMBER(*,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"IDEXEC_MUSICA" NUMBER(*,0), 
	"IDMUSICA" NUMBER(*,0), 
	"IDAUTOR" NUMBER(*,0), 
	"DT_INICIAL" DATE, 
	"DT_FINAL" DATE, 
	"VALORFINAL" NUMBER(10,2)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRE_PAGAMENTO_TBLAUX
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PRE_PAGAMENTO_TBLAUX" 
   (	"IDEXEC_MUSICA" NUMBER(*,0), 
	"IDMUSICA" NUMBER(*,0), 
	"VALORUNITARIOEXEC" NUMBER(10,2), 
	"QTDEPERIODO" NUMBER(*,0), 
	"IDAUTOR" NUMBER(*,0), 
	"PERCENTUAL" NUMBER(10,2)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_MUSICA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_MUSICA" ON "SYSTEM"."MUSICA" ("IDMUSICA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_MUSICA_AUTOR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_MUSICA_AUTOR" ON "SYSTEM"."MUSICA_AUTOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_AUTORES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_AUTORES" ON "SYSTEM"."AUTOR" ("IDAUTOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_EXEC_MUSIC
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_EXEC_MUSIC" ON "SYSTEM"."EXEC_MUSICA" ("IDEXEC_MUSICA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_IDPAGAMENTO_PROCESSADO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_IDPAGAMENTO_PROCESSADO" ON "SYSTEM"."PAGAMENTO_PROCESSADO" ("IDPAGAMENTO_PROCESSADO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MUSICA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MUSICA" MODIFY ("IDMUSICA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MUSICA" ADD CONSTRAINT "PK_MUSICA" PRIMARY KEY ("IDMUSICA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MUSICA_AUTOR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MUSICA_AUTOR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MUSICA_AUTOR" ADD CONSTRAINT "PK_MUSICA_AUTOR" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUTOR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."AUTOR" MODIFY ("IDAUTOR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."AUTOR" MODIFY ("NOME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."AUTOR" ADD CONSTRAINT "PK_AUTORES" PRIMARY KEY ("IDAUTOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EXEC_MUSICA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."EXEC_MUSICA" MODIFY ("IDEXEC_MUSICA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."EXEC_MUSICA" ADD CONSTRAINT "PK_EXEC_MUSIC" PRIMARY KEY ("IDEXEC_MUSICA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAGAMENTO_PROCESSADO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PAGAMENTO_PROCESSADO" MODIFY ("IDPAGAMENTO_PROCESSADO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAGAMENTO_PROCESSADO" ADD CONSTRAINT "PK_IDPAGAMENTO_PROCESSADO" PRIMARY KEY ("IDPAGAMENTO_PROCESSADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MUSICA_AUTOR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MUSICA_AUTOR" ADD CONSTRAINT "FK_AUTOR_IDAUTOR" FOREIGN KEY ("IDAUTOR")
	  REFERENCES "SYSTEM"."AUTOR" ("IDAUTOR") ENABLE;
  ALTER TABLE "SYSTEM"."MUSICA_AUTOR" ADD CONSTRAINT "FK_MUSICA_IDMUSICA" FOREIGN KEY ("IDMUSICA")
	  REFERENCES "SYSTEM"."MUSICA" ("IDMUSICA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EXEC_MUSICA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."EXEC_MUSICA" ADD CONSTRAINT "FK_MUSICA_IDMUSICA_EXEC_MUSICA" FOREIGN KEY ("IDMUSICA")
	  REFERENCES "SYSTEM"."MUSICA" ("IDMUSICA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAGAMENTO_PROCESSADO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PAGAMENTO_PROCESSADO" ADD CONSTRAINT "FK_PAGAMENTO_PROCESSADO_IDEXEC_MUSICA" FOREIGN KEY ("IDEXEC_MUSICA")
	  REFERENCES "SYSTEM"."EXEC_MUSICA" ("IDEXEC_MUSICA") ENABLE;