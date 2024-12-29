-- CREATE TABLES
-- REFERENCE DATA TABLES ARE LOADED BASED ON USAGE
DROP TABLE IF EXISTS REFDATA_STATUS;
CREATE TABLE REFDATA_STATUS
(
    STATUS_ID          VARCHAR(38) ,
    STATUS_DESCRIPTION VARCHAR(45) NOT NULL,
    MAINTAINED_DATE       VARCHAR(20) ,
    CREATED_USER       VARCHAR(20)
);

DROP TABLE IF EXISTS REFDATA_VENDORS;
CREATE TABLE REFDATA_VENDORS
(
    VENDOR_ID    VARCHAR(38)   ,
    VENDOR_NAME  VARCHAR(50),
    MAINTAINED_DATE VARCHAR(20) ,
    STATUS_ID    VARCHAR(38),
    CREATED_USER VARCHAR(20)
);

DROP TABLE IF EXISTS REFDATA_USSTATES;
CREATE TABLE REFDATA_USSTATES
(
    STATE_ID          VARCHAR(2) PRIMARY KEY,
    STATE_DESCRIPTION VARCHAR(65),
    LATTITUDE         VARCHAR(12),
    LONGITUDE         VARCHAR(12),
    MAINTAINED_DATE      VARCHAR(20) ,
    STATUS_ID         VARCHAR(38),
    CREATED_USER      VARCHAR(20)
);

DROP TABLE IF EXISTS REFDATA_LEGALENTITIES;
CREATE TABLE REFDATA_LEGALENTITIES
(
    LEGALENTITY_GUID VARCHAR(38)  ,
    LOCATION_NAME    VARCHAR(50),
    ADDRESS          VARCHAR(75),
    CITY             VARCHAR(60),
    STATE_ID         VARCHAR(2),
    ZIPCODE          VARCHAR(12),
    CREATED_USER     VARCHAR(20),
    STATUS_ID        VARCHAR(38),
    MAINTAINED_DATE     VARCHAR(20) ,
    LOCATION_URL     VARCHAR(99),
    LOCATION_PHONE   VARCHAR(12)
);

DROP TABLE IF EXISTS REFDATA_ORGANIZATIONS;
CREATE TABLE REFDATA_ORGANIZATIONS
(
    ORGANIZATION_GUID          VARCHAR(38) ,
    ORGANIZATION_INTERNAL_CODE VARCHAR(10),
    ORGANIZATION_INTERNAL_ID   VARCHAR(10),
    ORGANIZATION_NAME          VARCHAR(50),
    ADDRESS                   VARCHAR(75),
    CITY                       VARCHAR(60),
    STATE_ID                   VARCHAR(2),
    ZIPCODE                    VARCHAR(12),
    CREATED_USER               VARCHAR(20),
    STATUS_ID                  VARCHAR(38),
    MAINTAINED_DATE               VARCHAR(20) ,
    LEGALENTITY_GUID           VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_APPLICATIONS;
CREATE TABLE REFDATA_APPLICATIONS
(
    APP_GUID               VARCHAR(38) ,
    APPLICATION_CUSTOMCODE VARCHAR(15),
    APPLICATION_DESC       VARCHAR(50),
    CREATED_USER           VARCHAR(20),
    MAINTAINED_DATE           VARCHAR(20) ,
    STATUS_ID              VARCHAR(38),
    VENDOR_ID              VARCHAR(38),
    INDUSTRY_OID           VARCHAR(49),
    ORGANIZATION_GUID      VARCHAR(38),
);

DROP TABLE IF EXISTS REFDATA_SENSITIVITYFLAGS;
CREATE TABLE REFDATA_SENSITIVITYFLAGS
(
    SENSITIVITYFLAG_ID   VARCHAR(38) ,
    SENSITIVITYFLAG_DESC VARCHAR(30),
    MAINTAINED_DATE       VARCHAR(20) ,
    STATUS_ID           VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_CODESETS;
CREATE TABLE REFDATA_CODESETS
(
    CODESETS_ID        VARCHAR(38) ,
    CODESET_NAME       VARCHAR(50),
    INDUSTRY_STD       VARCHAR(6),
    STATUS_ID          VARCHAR(38),
    MAINTAINED_DATE       VARCHAR(20) ,
    CREATED_USER       VARCHAR(20),
    FIELD_MAPPING      VARCHAR(40),
    SENSITIVITYFLAG_ID VARCHAR(38),
    EXTERNALTABLE_ID   VARCHAR(20),
    EXTERNAL_NOTES     VARCHAR(149),
    EXTERNAL_LINK      VARCHAR(99)
);

DROP TABLE IF EXISTS REFDATA_DATAATTRIBUTES;
CREATE TABLE REFDATA_DATAATTRIBUTES
(
    DATAATTRIBUTE_ID  TEXT PRIMARY KEY DEFAULT (LOWER(HEX(RANDOMBLOB(16)))),
    DATAATTRIBUTE_NAME         VARCHAR(50),
    SENSITIVITYFLAG_ID          VARCHAR(38),
    MAINTAINED_DATE                VARCHAR(20) ,
    STATUS_ID                   VARCHAR(38),
    CREATED_USER                VARCHAR(20),
    REGISTEREDAPP_GUID          VARCHAR(38),
    ATTRIBUTE_TYPE              VARCHAR(10)
);

DROP TABLE IF EXISTS REFDATA_DATASTRUCTURES;
CREATE TABLE REFDATA_DATASTRUCTURES
(
    DATASTRUCTURE_ID   VARCHAR(38) ,
    DATASTRUCTURE_NAME           VARCHAR(50),
    SENSITIVITYFLAG_ID           VARCHAR(38),
    MAINTAINED_DATE                 VARCHAR(20) ,
    STATUS_ID                    VARCHAR(38),
    CREATED_USER                 VARCHAR(20),
    REGISTEREDAPP_GUID           VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_DEVICETYPES;
CREATE TABLE REFDATA_DEVICETYPES
(
    DEVICETYPE_ID VARCHAR(38) ,
    DEVICETYPE    VARCHAR(30),
    MAINTAINED_DATE  VARCHAR(20) ,
    STATUS_ID     VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRYSTDS;
CREATE TABLE REFDATA_INDUSTRYSTDS
(
    INDUSTRY_STD     VARCHAR(6),
    INDUSTRYSTD_DESC VARCHAR(30),
    MAINTAINED_DATE     VARCHAR(20) ,
    STATUS_ID        VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRYSTD_EVENTTYPES;
CREATE TABLE REFDATA_INDUSTRYSTD_EVENTTYPES
(
    EVENTTYPE_ID   VARCHAR(10) NOT NULL,
    EVENTTYPE_DESC VARCHAR(30),
    INDUSTRY_STD   VARCHAR(6),
    MAINTAINED_DATE   VARCHAR(20) ,
    STATUS_ID      VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRIES;
CREATE TABLE REFDATA_INDUSTRIES
(
    INDUSTRY_ID   VARCHAR(38)  ,
    INDUSTRY_NAME VARCHAR(45),
    MAINTAINED_DATE  VARCHAR(20) ,
    STATUS_ID     VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_INDUSTRIES_BUSINESS;
CREATE TABLE REFDATA_INDUSTRIES_BUSINESS
(
    INDUSTRYTOBUSINESS_ID VARCHAR(38) ,
    INDUSTRY_ID           VARCHAR(38),
    BUSINESS_AREA         VARCHAR(50),
    MAINTAINED_DATE          VARCHAR(20) ,
    STATUS_ID             VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_OPERATIONTYPES;
CREATE TABLE REFDATA_OPERATIONTYPES
(
    OPERATIONTYPE_ID   VARCHAR(10) PRIMARY KEY,
    OPERATIONTYPE_NAME VARCHAR(60),
    MAINTAINED_DATE       VARCHAR(20) ,
    STATUS_ID          VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_PROFESSIONTYPES;
CREATE TABLE REFDATA_PROFESSIONTYPES
(
    PROFESSIONTYPE_ID   VARCHAR(38) ,
    PROFESSIONTYPE_NAME VARCHAR(65),
    CREATED_USER       VARCHAR(20),
    MAINTAINED_DATE        VARCHAR(20) ,
    STATUS_ID           VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_RULESETS;
CREATE TABLE REFDATA_RULESETS
(
    RULE_ID         VARCHAR(38) ,
    RULE_NAME       VARCHAR(65),
    CREATED_USER    VARCHAR(20),
    MAINTAINED_DATE    VARCHAR(20) ,
    STATUS_ID       VARCHAR(38),
    EXPIRATION_DATE VARCHAR(20)
);

DROP TABLE IF EXISTS REFDATA_TERMINOLOGYSTDS;
CREATE TABLE REFDATA_TERMINOLOGYSTDS
(
    TERMINOLOGY_STD        VARCHAR(25) PRIMARY KEY,
    TERMINOLOGYSTD_VERSION VARCHAR(10) NOT NULL,
    TERMINOLOGYSTD_DESC    VARCHAR(129),
    MAINTAINED_DATE           VARCHAR(20) ,
    STATUS_ID              VARCHAR(38)
);

DROP TABLE IF EXISTS REFDATA_TIMEZONES;
CREATE TABLE REFDATA_TIMEZONES
(
    TIMEZONE_ID VARCHAR(3) PRIMARY KEY,
    TIMEZONE_DESC  VARCHAR(25),
    MAINTAINED_DATE   VARCHAR(20) ,
    STATUS_ID      VARCHAR(38)
);

-- DATAMODEL
DROP TABLE IF EXISTS DATAMODEL_APIS;
CREATE TABLE DATAMODEL_APIS
(
    API_ID             VARCHAR(38) ,
    TECHNOLOGY         TEXT,
    DATAATTRIBUTE_ID   TEXT,
    BASEURLLOCATION    TEXT,
    APINAME            TEXT,
    MAINTAINED_DATE       TEXT ,
    STATUS_ID          VARCHAR(38),
    PURPOSE            TEXT,
    DATMODEL_TABLENAME TEXT,
    APIPARAMS          TEXT,
    APIEXAMPLE         TEXT
);

DROP TABLE IF EXISTS DATAMODEL_DATATABLES;
CREATE TABLE DATAMODEL_DATATABLES
(
    TABLENAME        TEXT NOT NULL,
    TABLEINFORMATION TEXT,
    STATUS_ID        VARCHAR(38),
    MAINTAINED_DATE     TEXT ,
    DATADOMAIN       TEXT
);

DROP TABLE IF EXISTS DATAMODEL_DOMAINS;
CREATE TABLE DATAMODEL_DOMAINS
(
    DOMAINNAME        TEXT NOT NULL,
    DOMAININFORMATION TEXT,
    STATUS_ID         VARCHAR(38),
    MAINTAINED_DATE      TEXT
);

-- DATA TIER
DROP TABLE IF EXISTS DATATIER_CRAWLERS;
CREATE TABLE DATATIER_CRAWLERS
(
    DATACRAWLER_ID      INTEGER,
    TOKEN               TEXT,
    CRAWLEDTEXT_DETAILS TEXT,
    MAINTAINED_DATE        TEXT    ,
    STATUS_ID           VARCHAR(38),
    REGISTEREDAPP_GUID  VARCHAR(38),
    ORGANIZATION_GUID   VARCHAR(38)
);

DROP TABLE IF EXISTS DATATIER_SDP_DATASTRUCTURES;
CREATE TABLE DATATIER_SDP_DATASTRUCTURES
(
    DATASTRUCTURE_CORE_ID INTEGER,
    DATASTRUCTURE_NAME    TEXT,
    DATASTRUCTURE_DETAILS TEXT,
    MAINTAINED_DATE          TEXT ,
    STATUS_ID             VARCHAR(38),
    REGISTEREDAPP_GUID    VARCHAR(38
);

DROP TABLE IF EXISTS DATATIER_SDP_DATAATTRIBUTES;
CREATE TABLE DATATIER_SDP_DATAATTRIBUTES
(
    DATATIER_ID        INTEGER,
    BASEVALUE          VARCHAR(149),
    SUPPORTINGVALUE1   VARCHAR(149),
    SUPPORTINGVALUE2   VARCHAR(149),
    SUPPORTINGVALUE3   VARCHAR(149),
    SUPPORTINGVALUE4   VARCHAR(149),
    SUPPORTINGVALUE5   VARCHAR(149),
    SUPPORTINGVALUE6   VARCHAR(149),
    SUPPORTINGVALUE7   VARCHAR(149),
    MAINTAINED_DATE       VARCHAR(149),
    STATUS_ID          VARCHAR(38),
    DATAATTRIBUTE_ID   VARCHAR(38),
    CREATED_USER       VARCHAR(20),
    REGISTEREDAPP_GUID VARCHAR(38)
);
DROP TABLE IF EXISTS DATATIER_SDP_DATAATTRIBUTES_METADATA;
CREATE TABLE IF NOT EXISTS DATATIER_SDP_DATAATTRIBUTES_METADATA
(
    SDP_DATAATTRIBUTE_METADATA_ID INTEGER,
    DATAATTRIBUTE_PARAM  VARCHAR(99),
    DATAATTRIBUTE_VALUE  VARCHAR(169),
    MAINTAINED_DATE         TIMESTAMP,
    STATUS_ID            VARCHAR(10) DEFAULT 'ACTIVE',
    DATAATTRIBUTE_ID     CHAR(38),
    CREATED_USER         VARCHAR(20) DEFAULT 'PLATFORM',
    DATAATTRIBUTE_GUID   CHAR(38),
    REGISTEREDAPP_GUID   CHAR(38)
);

DROP TABLE IF EXISTS PLATFORM_DATASOURCES;
CREATE TABLE PLATFORM_DATASOURCES
(
    PLATFORM_DATASOURCES_ID VARCHAR(38),
    DATASOURCE_NAME         VARCHAR(79),
    DATASOURCE_TYPE         VARCHAR(30),
    MAINTAINED_DATE            VARCHAR(20),
    STATUS_ID               VARCHAR(38),
    CREATED_USER            VARCHAR(38),
    ORGANIZATION_GUID       VARCHAR(38),
    REGISTEREDAPP_GUID      VARCHAR(38)
);

DROP TABLE IF EXISTS DATATIER_TOKENS;
CREATE TABLE DATATIER_TOKENS
(
    DATATOKEN_ID       INTEGER,
    TOKEN              VARCHAR(128),
    MAINTAINED_DATE       TEXT ,
    STATUS_ID          VARCHAR(38),
    REGISTEREDAPP_GUID VARCHAR(38),
    ORGANIZATION_GUID  VARCHAR(38),
    INTFC_TYPE         TEXT      DEFAULT 'API',
    DATASOURCE_ID      VARCHAR(38)
);

-- PLATFORM
DROP TABLE IF EXISTS PLATFORM_CODESETS;
CREATE TABLE PLATFORM_CODESETS
(
    PLATFORM_CODESET_ID  VARCHAR(38) ,
    APPLICATION_GUID    VARCHAR(38),
    ORGANIZATION_GUID   VARCHAR(38),
    CODESETS_ID VARCHAR(38),
    MAINTAINED_DATE       VARCHAR(20) ,
    STATUS_ID           VARCHAR(38),
    CREATED_USER        VARCHAR(20),
    ORIGINALCODE_VALUE  VARCHAR(40),
    ORIGINALCODE_DESC   VARCHAR(149)
);

DROP TABLE IF EXISTS PLATFORM_CODESETS_INDUSTRYSTDS;
CREATE TABLE PLATFORM_CODESETS_INDUSTRYSTDS
(
    TERM_CODESET_ID VARCHAR(38),
    MAINTAINED_DATE    VARCHAR(20)             ,
    STATUS_ID       VARCHAR(38),
    CUI             VARCHAR(8) NULL,
    LAT             VARCHAR(3) NULL,
    TS              VARCHAR(1) NULL,
    LUI             VARCHAR(10) NULL,
    STT             VARCHAR(3) NULL,
    SUI             VARCHAR(10) NULL,
    ISPREF          VARCHAR(1) NULL,
    AUI             VARCHAR(9) NULL,
    SAUI            VARCHAR(50) NULL,
    SCUI            VARCHAR(50) NULL,
    SDUI            VARCHAR(50) NULL,
    SAB             VARCHAR(25) NULL,
    TTY             VARCHAR(20) NULL,
    CODE            VARCHAR(50) NULL,
    STR             TEXT NULL,
    SRL             INT NULL,
    SUPPRESS        VARCHAR(1) NULL,
    CVF             INT NULL
);

DROP TABLE IF EXISTS PLATFORM_CODESETS_XMAPS;
CREATE TABLE PLATFORM_CODESETS_XMAPS
(
    CODESETCROSSMAP_ID  VARCHAR(38) ,
    REGISTEREDAPP_GUID     VARCHAR(38),
    ORGANIZATION_GUID    VARCHAR(38),
    TERMINOLOGYSTD_FROM      VARCHAR(25),
    TERMINOLOGYSTD_TO    VARCHAR(25),
    MAINTAINED_DATE         VARCHAR(20) ,
    STATUS_ID           VARCHAR(38),
    CREATED_USER         VARCHAR(20),
    TRANSFORMCODE_VALUE  VARCHAR(40),
    TRANSFORMCODE_DESC   VARCHAR(129),
    ORIGINALCODE_VALUE   VARCHAR(40),
    ORIGINALCODE_DESC    VARCHAR(129)
);

DROP TABLE IF EXISTS PLATFORM_DATAGENERATION_DATAATTRIBUTES;
CREATE TABLE PLATFORM_DATAGENERATION_DATAATTRIBUTES
(
    DATAGENTYPE_ID          VARCHAR(38) ,
    DATAGENTYPE_DESCRIPTION VARCHAR(65),
    DEFINITION              VARCHAR(255),
    DATAATTRIBUTE_ID        VARCHAR(38),
    MAINTAINED_DATE            VARCHAR(20) ,
    STATUS_ID               VARCHAR(38),
    CREATED_USER            VARCHAR(20),
    QUANTITY                INTEGER,
    MAXRECORDS_IN_SOURCE      INTEGER,
    REGISTEREDAPP_GUID      VARCHAR(38),
    ORGANIZATION_GUID       VARCHAR(38)
);

DROP TABLE IF EXISTS PLATFORM_DATABUILDING_DATAATTRIBUTES;
CREATE TABLE PLATFORM_DATABUILDING_DATAATTRIBUTES
(
    DATABUILD_DATAATTRIBUTE_ID VARCHAR(38) ,
    DATABUILD_DESCRIPTION VARCHAR(65),
    DEFINITION              VARCHAR(255),
    DATAATTRIBUTE_ID        VARCHAR(38),
    MAINTAINED_DATE            VARCHAR(20) ,
    STATUS_ID               VARCHAR(38),
    CREATED_USER            VARCHAR(20),
    QUANTITY                INTEGER,
    MAXRECORDS_IN_SOURCE      INTEGER,
    REGISTEREDAPP_GUID      VARCHAR(38),
    ORGANIZATION_GUID       VARCHAR(38),
    PARAM1 VARCHAR(30),
    PARAM1_OPERATOR VARCHAR(7),
    PARAM1_VALUE VARCHAR(65),
    PARAM2 VARCHAR(30),
    PARAM2_OPERATOR VARCHAR(7),
    PARAM2_VALUE VARCHAR(65),
    PARAM3 VARCHAR(30),
    PARAM3_OPERATOR VARCHAR(7),
    PARAM3_VALUE VARCHAR(65),
    PARAM4 VARCHAR(30),
    PARAM4_OPERATOR VARCHAR(7),
    PARAM4_VALUE VARCHAR(30)
);

DROP TABLE IF EXISTS PLATFORM_DATABUILDING_DATASTRUCTURES;
CREATE TABLE PLATFORM_DATABUILDING_DATASTRUCTURES
(
    DATABUILD_DATASTRUCTURES_ID  VARCHAR(38) ,
    DATABUILD_DESCRIPTION VARCHAR(65),
    DEFINITION              VARCHAR(255),
    DATASTRUCTURE_ID        VARCHAR(38),
    MAINTAINED_DATE            VARCHAR(20) ,
    STATUS_ID               VARCHAR(38),
    CREATED_USER            VARCHAR(38),
    QUANTITY                INTEGER,
    MAXRECORDS_IN_SOURCE      INTEGER,
    REGISTEREDAPP_GUID      VARCHAR(38),
    ORGANIZATION_GUID       VARCHAR(38)
);

DROP TABLE IF EXISTS PLATFORM_DATASTRUCTURES_DTL;
CREATE TABLE PLATFORM_DATASTRUCTURES_DTL
(
    PLATFORM_DATASTRUCTURESDTL_ID    VARCHAR(38) ,
    DATASTRUCTURE_ID                     VARCHAR(38),
    COMPOSITE_DATASTRUCTURE_NAME                   VARCHAR(50),
    SENSITIVITYFLAG_ID                             VARCHAR(38),
    MAINTAINED_DATE                                   VARCHAR(20) ,
    STATUS_ID                                      VARCHAR(38),
    CREATED_USER                                   VARCHAR(20),
    REGISTEREDAPP_GUID                             VARCHAR(38),
    ORGANIZATIONAPP_GUID                             VARCHAR(38),
    DATAATTRIBUTE_ID                     VARCHAR(38)
);

DROP TABLE IF EXISTS PLATFORM_RULESETS_DEFINITIONS;
CREATE TABLE PLATFORM_RULESETS_DEFINITIONS
(
    RULESET_DEFINITIONS_ID   VARCHAR(38) ,
    RULESET_DEFINITIONS_NAME VARCHAR(65),
    RULESET_ID              VARCHAR(38),
    STEPORDER_ID            INTEGER,
    OPERATIONTYPE_ID        VARCHAR(10),
    RULESET_DEFVALUE        VARCHAR(20),
    STATUS_ID               VARCHAR(38),
    MAINTAINED_DATE           VARCHAR(20) ,
    EFFECTIVE_DATE          VARCHAR(20),
    REGISTEREDAPP_GUID        VARCHAR(38),
    TERM_DATE               VARCHAR(20),
    DATAATTRIBUTE_ID        VARCHAR(38)
);

DROP TABLE IF EXISTS PLATFORM_TOKENS_XMAPS;
CREATE TABLE PLATFORM_TOKENS_XMAPS
(
    PLATFORM_TOKENS_XMAP_ID VARCHAR(38) ,
    DATASTRUCTURE_ID            VARCHAR(38),
    XMAP_DETAILS                          VARCHAR(75),
    DATAATTRIBUTE_ID                      VARCHAR(38),
    FIELDORDER_ID                         INTEGER   DEFAULT 1,
    MAINTAINED_DATE                          VARCHAR(20) ,
    STATUS_ID                             VARCHAR(38),
    CREATED_USER                          VARCHAR(20),
    REGISTEREDAPP_GUID                    VARCHAR(38),
    ORGANIZATION_GUID                     VARCHAR(38)
);
