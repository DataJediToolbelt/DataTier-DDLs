use schema DATASYNTHESIS;
DROP TABLE IF EXISTS REFDATA_STATUS;
CREATE TABLE REFDATA_STATUS (
       STATUS_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_STATUS PRIMARY KEY,
       STATUS_DESCRIPTION VARCHAR(45) NOT NULL,
       CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
       CREATED_USER VARCHAR(20)
);

DROP TABLE IF EXISTS DATATIER_DATASTRUCTUES;
CREATE TABLE DATATIER_DATASTRUCTUES (
    DATASTRUCTURECOREID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_DATABUILT_DATASTRUCTURES PRIMARY KEY,
    DATASTRUCTURENAME VARCHAR(29),
    DATASTRUCTUREDETAILS TEXT,
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUSID NUMBER DEFAULT 1,
    REGISTEREDAPP CHAR(38),
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS DATATIER;
CREATE TABLE DATATIER (
    DATATIERID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_DATATIER PRIMARY KEY,
    BASEVALUE VARCHAR(99),
    SUPPORTINGVALUE1 VARCHAR(169),
    SUPPORTINGVALUE2 VARCHAR(50),
    SUPPORTINGVALUE3 VARCHAR(50),
    SUPPORTINGVALUE4 VARCHAR(50),
    SUPPORTINGVALUE5 VARCHAR(50),
    SUPPORTINGVALUE6 VARCHAR(50),
    SUPPORTINGVALUE7 VARCHAR(50),
    DATAATTRIBUTEID NUMBER,
    DATAGENTYPEID NUMBER,
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUSID NUMBER DEFAULT 1,
    CREATEDUSER VARCHAR(20),
    REGISTEREDAPP CHAR(38),
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS DATAMODEL_APIS;
CREATE TABLE DATAMODEL_APIS (
    APIID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_APIS PRIMARY KEY,
    TECHNOLOGY VARCHAR(30),
    BASEURLLOCATION VARCHAR(99),
    APINAME VARCHAR(79),
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUSID NUMBER DEFAULT 1,
    PURPOSE VARCHAR(49),
    DATMODEL_TABLENAME VARCHAR(99),
    APIPARAMS VARCHAR(59),
    APIEXAMPLE VARCHAR(149),
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS DATAMODEL_DATATABLES;
CREATE TABLE DATAMODEL_DATATABLES (
    TABLENAME VARCHAR(64) CONSTRAINT PK_DATAMODEL_DATATABLES PRIMARY KEY,
    TABLEINFORMATION VARCHAR(249),
    STATUSID NUMBER DEFAULT 1,
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    DATADOMAIN VARCHAR(64),
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS DATAMODEL_DOMAIN;
CREATE TABLE DATAMODEL_DOMAIN (
     DOMAINNAME VARCHAR(64) CONSTRAINT PK_DATAMODEL_DOMAIN PRIMARY KEY,
     DOMAININFORMATION VARCHAR(249),
     STATUSID NUMBER DEFAULT 1,
     CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
     FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS PLATFORM_DATAATTRIBUTES;
CREATE TABLE PLATFORM_DATAATTRIBUTES (
      PLATFORM_DATAATTRIBUTES_ID NUMBER autoincrement start 1 increment 1  CONSTRAINT PK_PLATFORM_DATAATTRIBUTES PRIMARY KEY,
      DATAATTRIBUTE_NAME VARCHAR(50),
      SENSITIVITYFLAG_ID NUMBER,
      CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
      STATUS_ID NUMBER DEFAULT 1,
      CREATED_USER VARCHAR(20),
      PLATFORM_DATAATTRIBUTE_GUID CHAR(38),
      REGISTERED_APP CHAR(38),
      PLATFORM_TABLE_NAME VARCHAR(38),
      FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS PLATFORM_DATAGENERATION;
CREATE TABLE PLATFORM_DATAGENERATION (
      DATAGENTYPE_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_DATAGENTYPES PRIMARY KEY,
      DATAGENTYPE_DESCRIPTION VARCHAR(65),
      DEFINITION VARCHAR(255),
      DATAATTRIBUTE_ID NUMBER,
      CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
      STATUS_ID NUMBER DEFAULT 1,
      CREATED_USER VARCHAR(20),
      QUANTITY INT,
      MAXRECORDSINSOURCE INT,
      REGISTERED_APP VARCHAR(38),
      ORGANIZATION_GUID VARCHAR(38),
      FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS PLATFORM_DATASTRUCTURES;
CREATE TABLE PLATFORM_DATASTRUCTURES (
    PLATFORM_DATASTRUCTURES_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_PLATFORM_CONFIG_DATASTRUCTURES PRIMARY KEY,
    DATASTRUCTURE_NAME VARCHAR(50),
    SENSITIVITYFLAG_ID NUMBER,
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUS_ID NUMBER DEFAULT 1,
    CREATED_USER VARCHAR(20),
    PLATFORM_DATASTRUCTURES_GUID CHAR(38),
    REGISTERED_APP CHAR(38),
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS PLATFORM_DATASTRUCTURES_DTL;
CREATE TABLE PLATFORM_DATASTRUCTURES_DTL (
    PLATFORM_DATASTRUCTURES_DTL_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_PLATFORM_CONFIG_DATASTRUCTURES_DTL PRIMARY KEY,
    PLATFORM_DATASTRUCTURES_ID NUMBER,
    COMPOSITE_DATASTRUCTURE_NAME VARCHAR(50),
    SENSITIVITYFLAG_ID NUMBER,
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUS_ID NUMBER DEFAULT 1,
    CREATED_USER VARCHAR(20),
    PLATFORM_DATASTRUCTURES_TO_DATAATTRIBUTES_GUID CHAR(38),
    REGISTERED_APP CHAR(38),
    PLATFORM_DATAATTRIBUTES_ID INT,
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);


DROP TABLE IF EXISTS REFDATA_APPLICATION;
CREATE TABLE REFDATA_APPLICATION (
     APP_GUID CHAR(38) DEFAULT UUID_STRING() CONSTRAINT PK_REFDATA_APPLICATION PRIMARY KEY,
     APPLICATION_CUSTOMCODE VARCHAR(15),
     APPLICATION_DESC VARCHAR(50),
     CREATED_USER VARCHAR(20),
     CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
     STATUS_ID NUMBER DEFAULT 1,
     VENDOR_ID NUMBER,
     INDUSTRY_OID VARCHAR(49),
     ORGANIZATION_UID VARCHAR(49),
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_CODESET;
CREATE TABLE REFDATA_CODESET (
    CODESETS_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_CODESET PRIMARY KEY,
    CODESET_NAME VARCHAR(50),
    INDUSTRY_STD VARCHAR(6),
    STATUS_ID NUMBER DEFAULT 1,
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    CREATED_USER VARCHAR(20),
    CODESET_GUID CHAR(38),
    FIELD_MAPPING VARCHAR(40),
    SENSITIVITYFLAG_ID NUMBER,
    EXTERNALTABLE_ID VARCHAR(20),
    EXTERNAL_NOTES VARCHAR(149),
    EXTERNAL_LINK VARCHAR(99),
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_CODESETS_CROSSMAPS;
CREATE TABLE REFDATA_CODESETS_CROSSMAPS (
    CODESETCROSSMAPID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_CODESETS_CROSSMAPS PRIMARY KEY,
    IMPLCODESETSID INT NOT NULL,
    CODESETTOAPPLICATIONID BIGINT,
    TERMINOLOGYSTDTO NUMBER,
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUSID NUMBER DEFAULT 1,
    CREATEDUSER VARCHAR(20),
    TRANSFORMCODEVALUE VARCHAR(40),
    TRANSFORMCODEDESC VARCHAR(129),
    ORIGINALCODEVALUE VARCHAR(40),
    ORIGINALCODEDESC VARCHAR(40),
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS REFDATA_COUNTRIES;
CREATE TABLE REFDATA_COUNTRIES (
    COUNTRY_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_COUNTRIES PRIMARY KEY,
    IDD VARCHAR(5),
    COUNTRY_NAME VARCHAR(59),
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUS_ID NUMBER DEFAULT 1,
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);


DROP TABLE IF EXISTS REFDATA_DEVICETYPES;
CREATE TABLE REFDATA_DEVICETYPES (
    DEVICETYPE_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_DEVICETYPES PRIMARY KEY,
    DEVICETYPE VARCHAR(30),
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUS_ID NUMBER DEFAULT 1,
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRIES;
CREATE TABLE REFDATA_INDUSTRIES (
    INDUSTRY_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_INDUSTRIES PRIMARY KEY,
    INDUSTRY_NAME VARCHAR(45),
    CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUS_ID NUMBER DEFAULT 1,
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRIESTOBUSINESS;
CREATE TABLE REFDATA_INDUSTRIESTOBUSINESS (
    INDUSTRYTOBUSINESS_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_INDUSTRIESTOBUSINESS PRIMARY KEY,
    INDUSTRY_ID NUMBER,
    BUSINESS_AREA VARCHAR(50),
    CREATED_DATE TIMESTAMPNTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUS_ID NUMBER DEFAULT 1,
    FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRYSTD;
CREATE TABLE REFDATA_INDUSTRYSTD (
    INDUSTRYSTD VARCHAR(6) CONSTRAINT PK_REFDATA_INDUSTRYSTD PRIMARY KEY,
    INDUSTRYSTDDESC VARCHAR(30),
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUSID NUMBER DEFAULT 1,
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS REFDATA_LEGALENTITIES;
CREATE TABLE REFDATA_LEGALENTITIES (
     LEGALENTITY_GUID CHAR(38) DEFAULT UUID_STRING() CONSTRAINT PK_REFDATA_LEGALENTITIES_GROUPERS PRIMARY KEY,
     LOCATION_NAME VARCHAR(50),
     ADDRESS VARCHAR(75),
     CITY VARCHAR(60),
     STATE_ID VARCHAR(2),
     ZIPCODE VARCHAR(12),
     CREATED_USER VARCHAR(20),
     STATUS_ID NUMBER DEFAULT 1,
     CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP() NOT NULL,
     LOCATION_URL VARCHAR(99),
     LOCATION_PHONE VARCHAR(12),
     FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_OPERATIONTYPE;
CREATE TABLE REFDATA_OPERATIONTYPE (
     OPERATIONTYPE_ID VARCHAR(7) CONSTRAINT PK_REFDATA_OPERATIONTYPE PRIMARY KEY,
     OPERATIONTYPE_NAME VARCHAR(60),
     CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
     STATUS_ID NUMBER DEFAULT 1,
     FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_ORGANIZATION;
CREATE TABLE REFDATA_ORGANIZATION (
      ORGANIZATION_GUID CHAR(38) DEFAULT UUID_STRING() CONSTRAINT PK_REFDATA_ORGANIZATION PRIMARY KEY,
      ORGANIZATION_INTERNAL_CODE VARCHAR(10),
      ORGANIZATION_INTERNAL_ID VARCHAR(10),
      ORGANIZATION_NAME VARCHAR(50),
      ADDRESS VARCHAR(75),
      CITY VARCHAR(60),
      STATE_ID VARCHAR(2),
      ZIPCODE VARCHAR(12),
      CREATED_USER VARCHAR(20),
      STATUS_ID NUMBER DEFAULT 1,
      CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP() NOT NULL,
      LEGALENTITY_GUID CHAR(38),
      FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_PROFESSIONTYPES;
CREATE TABLE REFDATA_PROFESSIONTYPES (
       PROFESSIONTYPEID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_PROFESSIONTYPES PRIMARY KEY,
       PROFESSIONTYPENAME VARCHAR(65),
       CREATEDUSER VARCHAR(20),
       CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
       STATUSID NUMBER DEFAULT 1,
       FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS REFDATA_REGEXTYPES;
CREATE TABLE REFDATA_REGEXTYPES (
       IMPLREGEXTYPEID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_REGEXTYPES PRIMARY KEY,
       REGEXTYPEDESC VARCHAR(69),
       CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
       STATUSID NUMBER DEFAULT 1,
       ORGANIZATIONID CHAR(38),
       APPLICATIONID CHAR(38),
       FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS REFDATA_RULESETS;
CREATE TABLE REFDATA_RULESETS (
       RULEID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_RULESETS PRIMARY KEY,
       RULENAME VARCHAR(65),
       CREATEDUSER VARCHAR(20),
       CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
       STATUSID NUMBER DEFAULT 1,
       FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS REFDATA_RULESETSDEFINITIONS; 
CREATE TABLE REFDATA_RULESETSDEFINITIONS (
       RULESETDEFINITIONS_ID CHAR(38) DEFAULT UUID_STRING() CONSTRAINT PK_REFDATA_RULESETSDEFINITIONS PRIMARY KEY,
       RULESETDEFINITION_NAME VARCHAR(50),
       RULESET_ID NUMBER,
       STEPORDER_ID NUMBER,
       OPERATIONTYPE_ID VARCHAR(7),
       RULESETDEF_VALUE CHAR(40),
       STATUS_ID NUMBER DEFAULT 1,
       CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
       EFFECTIVE_DATE DATETIME,
       APPLICATION_ID CHAR(38),
       TERM_DATE DATETIME,
       DATAATTRIBUTE_ID INT,
       FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_SENSITIVITYFLAG;
CREATE TABLE REFDATA_SENSITIVITYFLAG (
       SENSITIVEFLAG_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_SENSITIVITYFLAG PRIMARY KEY,
       SENSITIVEFLAG_DESC VARCHAR(30),
       CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
       STATUS_ID NUMBER DEFAULT 1,
       FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_TERMINOLOGYSTD;
CREATE TABLE REFDATA_TERMINOLOGYSTD (
        TERMINOLOGYSTD_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_TERMINOLOGYSTD PRIMARY KEY,
        TERMINOLOGYSTD VARCHAR(25) NOT NULL,
        TERMINOLOGYSTD_VERSION VARCHAR(10) NOT NULL,
        TERMINOLOGYSTD_DESC VARCHAR(129),
        CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
        STATUS_ID NUMBER DEFAULT 1,
        FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_TIMEZONES;
CREATE TABLE REFDATA_TIMEZONES (
        TIMEZONE_VALUE VARCHAR(3) CONSTRAINT PK_REFDATA_TIMEZONES PRIMARY KEY,
        TIMEZONE_DESC VARCHAR(25),
        CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
        STATUS_ID NUMBER DEFAULT 1,
        FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_USSTATES;
CREATE TABLE REFDATA_USSTATES (
        STATE_ID VARCHAR(2) CONSTRAINT PK_REFDATA_USSTATES PRIMARY KEY,
        STATE_DESCRIPTION VARCHAR(65),
        LATTITUDE VARCHAR(12),
        LONGITUDE VARCHAR(12),
        CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
        STATUS_ID NUMBER DEFAULT 1,
        CREATED_USER VARCHAR(20),
        FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS REFDATA_VENDOR;
CREATE TABLE REFDATA_VENDOR (
        VENDOR_ID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_REFDATA_VENDOR PRIMARY KEY,
        VENDOR_NAME VARCHAR(50),
        CREATED_DATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
        STATUS_ID NUMBER DEFAULT 1,
        CREATED_USER VARCHAR(20),
        VENDOR_GUID CHAR(38),
        FOREIGN KEY(STATUS_ID) REFERENCES REFDATA_STATUS(STATUS_ID)
);

DROP TABLE IF EXISTS TERMS_CODESET_INDUSTRYSTD;
CREATE TABLE TERMS_CODESET_INDUSTRYSTD (
    TERMCODESETID NUMBER autoincrement start 1 increment 1 CONSTRAINT PK_TERMS_CODESET_INDUSTRYSTD PRIMARY KEY,
    CODESETSID INT NOT NULL,
    CREATEDDATE TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    STATUSID NUMBER DEFAULT 1,
    CODEVALUE VARCHAR(20),
    CODEDESC VARCHAR(129),
    INDUSTRYSTD VARCHAR(6),
    TERMINOLOGYSTDID NUMBER,
    FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);

DROP TABLE IF EXISTS TERMS_UMLS_MRCONOSO;
CREATE TABLE TERMS_UMLS_MRCONOSO (
     CUI CHAR(8) NOT NULL,
     LAT CHAR(3) NOT NULL,
     TS CHAR(1) NOT NULL,
     LUI VARCHAR(10) NOT NULL,
     STT VARCHAR(3) NOT NULL,
     SUI VARCHAR(10) NOT NULL,
     ISPREF CHAR(1) NOT NULL,
     AUI VARCHAR(9) NOT NULL,
     SAUI VARCHAR(50),
     SCUI VARCHAR(100),
     SDUI VARCHAR(100),
     SAB VARCHAR(20) NOT NULL,
     TTY VARCHAR(20) NOT NULL,
     CODE VARCHAR(100) NOT NULL,
     STR VARCHAR(3000) NOT NULL,
     SRL VARCHAR(25) NOT NULL,
     SUPPRESS CHAR(1) NOT NULL,
     STATUSID NUMBER DEFAULT 1,
     CREATEDDATE TIMESTAMP_NTZ default CURRENT_TIMESTAMP(),
     FOREIGN KEY(STATUSID) REFERENCES REFDATA_STATUS(STATUSID)
);
