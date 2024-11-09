DROP TABLE IF EXISTS DATAMODEL_APIS;
CREATE TABLE DATAMODEL_APIS (
     APIID INTEGER NOT NULL,
     TECHNOLOGY STRING,
     BASEURLLOCATION STRING,
     APINAME STRING,
     CREATEDDATE DATE,
     STATUSID INTEGER,
     PURPOSE STRING,
     DATMODEL_TABLENAME STRING,
     APIPARAMS STRING,
     APIEXAMPLE STRING
);
ALTER TABLE DATAMODEL_APIS ADD CONSTRAINT xpk_DATAMODEL_APIS PRIMARY KEY (APIID);

DROP TABLE IF EXISTS DATAMODEL_DATATABLES;
CREATE TABLE DATAMODEL_DATATABLES (
    TABLENAME STRING NOT NULL,
    TABLEINFORMATION STRING,
    STATUSID INTEGER,
    CREATEDDATE TIMESTAMP,
    DOMAIN STRING
);
ALTER TABLE DATAMODEL_DATATABLES ADD CONSTRAINT xpk_DATAMODEL_DATATABLES PRIMARY KEY (TABLENAME);

DROP TABLE IF EXISTS DATAMODEL_DOMAIN;
CREATE TABLE DATAMODEL_DOMAIN (
     DOMAINNAME STRING NOT NULL,
     DOMAININFORMATION STRING,
     STATUSID INTEGER,
     CREATEDDATE TIMESTAMP
);
ALTER TABLE DATAMODEL_DOMAIN ADD CONSTRAINT xpk_DATAMODEL_DOMAIN PRIMARY KEY (DOMAINNAME);

DROP TABLE IF EXISTS DATATIER_DATASTRUCTURE;
CREATE TABLE DATATIER_DATASTRUCTURE (
    DATASTRUCTURECOREID INTEGER NOT NULL,
    DATASTRUCTURENAME STRING,
    DATASTRUCTUREDETAILS STRING,
    CREATEDDATE TIMESTAMP,
    STATUSID INTEGER,
    REGISTEREDAPP STRING
);
ALTER TABLE DATATIER_DATASTRUCTURE ADD CONSTRAINT xpk_DATATIER_DATASTRUCTURES PRIMARY KEY (DATASTRUCTURECOREID);

DROP TABLE IF EXISTS DATATIER;
CREATE TABLE DATATIER (
    DATATIERID INTEGER NOT NULL,
    BASEVALUE STRING,
    SUPPORTINGVALUE1 STRING,
    SUPPORTINGVALUE2 STRING,
    SUPPORTINGVALUE3 STRING,
    SUPPORTINGVALUE4 STRING,
    SUPPORTINGVALUE5 STRING,
    SUPPORTINGVALUE6 STRING,
    SUPPORTINGVALUE75 STRING,
    CREATEDDATE TIMESTAMP,
    STATUSID INTEGER,
    DATAATTRIBUTEID INTEGER,
    DATAGENTYPEID INTEGER,
    CREATEDUSER STRING,
    REGISTEREDAPP STRING
);
ALTER TABLE DATATIER ADD CONSTRAINT xpk_DATATIER PRIMARY KEY (ABABANKINGID);


DROP TABLE IF EXISTS REFDATA_APPLICATION;
CREATE TABLE REFDATA_APPLICATION (
	APP_GUID STRING NOT NULL,
	APPLICATION_CUSTOMCODE STRING,
	APPLICATION_DESC STRING,
	CREATED_USER STRING,
	CREATED_DATE TIMESTAMP,
	STATUS_ID INTEGER,
	VENDOR_ID INTEGER,
	INDUSTRY_OID STRING,
	ORGANIZATION_UID STRING
);
ALTER TABLE REFDATA_APPLICATION ADD CONSTRAINT xpk_REFDATA_APPLICATION PRIMARY KEY (APP_GUID);

DROP TABLE IF EXISTS REFDATA_DATAGENTYPES;
CREATE TABLE REFDATA_DATAGENTYPES (
	DATAGENTYPEID INTEGER NOT NULL,
	DATAGENTYPEDESCRIPTION STRING,
	DEFINITION STRING,
	DATAATTRIBUTEID INTEGER,
	CREATEDDATE TIMESTAMP,
	STATUSID INTEGER,
	CREATEDUSER STRING
);
ALTER TABLE REFDATA_DATAGENTYPES ADD CONSTRAINT xpk_REFDATA_DATAGENTYPES PRIMARY KEY (DATAGENTYPEID);

DROP TABLE IF EXISTS REFDATA_DEVICETYPES;
CREATE TABLE REFDATA_DEVICETYPES (
	DEVICETYPE_ID INTEGER NOT NULL,
	DEVICETYPE STRING,
	CREATED_DATE TIMESTAMP,
	STATUS_ID INTEGER
);
ALTER TABLE REFDATA_DEVICETYPES ADD CONSTRAINT xpk_REFDATA_DEVICETYPES PRIMARY KEY (DEVICETYPE_ID);

DROP TABLE IF EXISTS REFDATA_LEGALENTITIES;
CREATE TABLE REFDATA_LEGALENTITIES (
	LEGALENTITY_GUID STRING NOT NULL,
	LOCATION_NAME STRING,
	ADDRESS STRING,
	CITY STRING,
	STATE_ID STRING,
	ZIPCODE STRING,
	CREATED_USER STRING,
	STATUS_ID INTEGER,
	CREATED_DATE TIMESTAMP,
	LOCATION_URL STRING,
	LOCATION_PHONE STRING
);
ALTER TABLE REFDATA_LEGALENTITIES ADD CONSTRAINT xpk_REFDATA_LEGALENTITIES PRIMARY KEY (LEGALENTITY_GUID);

DROP TABLE IF EXISTS REFDATA_ORGANIZATION;
CREATE TABLE REFDATA_ORGANIZATION (
	ORGANIZATION_GUID STRING NOT NULL,
	ORGANIZATION_INTERNAL_CODE STRING,
	ORGANIZATION_INTERNAL_ID STRING,
	ORGANIZATION_NAME STRING,
	ADDRESS STRING,
	CITY STRING,
	STATE_ID STRING,
	ZIPCODE STRING,
	CREATED_USER STRING,
	STATUS_ID INTEGER,
	CREATED_DATE TIMESTAMP,
	LEGALENTITY_GUID STRING
);
ALTER TABLE REFDATA_ORGANIZATION ADD CONSTRAINT xpk_REFDATA_ORGANIZATION PRIMARY KEY (ORGANIZATION_GUID);

DROP TABLE IF EXISTS REFDATA_REGEXTYPES;
CREATE TABLE REFDATA_REGEXTYPES (
	IMPLREGEXTYPEID INTEGER NOT NULL,
	REGEXTYPEDESC STRING,
	CREATEDDATE TIMESTAMP,
	STATUSID INTEGER,
	ORGANIZATIONID STRING,
	APPLICATIONID STRING
);
ALTER TABLE REFDATA_REGEXTYPES ADD CONSTRAINT xpk_REFDATA_REGEXTYPES PRIMARY KEY (IMPLREGEXTYPEID);

DROP TABLE IF EXISTS REFDATA_SENSITIVITYFLAG;
CREATE TABLE REFDATA_SENSITIVITYFLAG (
	SENSITIVEFLAG_ID INTEGER NOT NULL,
	SENSITIVEFLAG_DESC STRING,
	CREATED_DATE TIMESTAMP,
	STATUS_ID INTEGER
);
ALTER TABLE REFDATA_SENSITIVITYFLAG ADD CONSTRAINT xpk_REFDATA_SENSITIVITYFLAG PRIMARY KEY (SENSITIVEFLAG_ID);

DROP TABLE IF EXISTS REFDATA_TIMEZONES;
CREATE TABLE REFDATA_TIMEZONES (
	TIMEZONE_VALUE STRING NOT NULL,
	TIMEZONE_DESC STRING,
	CREATED_DATE TIMESTAMP,
	STATUS_ID INTEGER
);
ALTER TABLE REFDATA_TIMEZONES ADD CONSTRAINT xpk_REFDATA_TIMEZONES PRIMARY KEY (TIMEZONEVALUE);

DROP TABLE IF EXISTS REFDATA_USSTATES;
CREATE TABLE REFDATA_USSTATES (
	STATE_ID STRING NOT NULL,
	STATE_DESCRIPTION STRING,
	LATTITUDE STRING,
	LONGITUDE STRING,
	CREATED_DATE TIMESTAMP,
	STATUS_ID INTEGER,
	CREATED_USER STRING
);
ALTER TABLE REFDATA_USSTATES ADD CONSTRAINT xpk_REFDATA_USSTATES PRIMARY KEY (STATE_ID);

DROP TABLE IF EXISTS REFDATA_VENDOR;
CREATE TABLE REFDATA_VENDOR (
	VENDOR_ID INTEGER NOT NULL,
	VENDOR_NAME STRING,
	CREATED_DATE TIMESTAMP,
	STATUS_ID INTEGER,
	CREATED_USER STRING,
	VENDOR_GUID STRING
);
ALTER TABLE REFDATA_VENDOR ADD CONSTRAINT xpk_REFDATA_VENDOR PRIMARY KEY (VENDOR_ID);

DROP TABLE IF EXISTS REFDATA_STATUS;
CREATE TABLE REFDATA_STATUS (
       STATUS_ID INTEGER,
       STATUS_DESCRIPTION STRING,
       CREATED_DATE DATE,
       CREATED_USER STRING
);
ALTER TABLE REFDATA_STATUS ADD CONSTRAINT xpk_REFDATA_STATUS PRIMARY KEY (STATUSID);

DROP TABLE IF EXISTS PLATFORM_DATAATTRIBUTES;
CREATE TABLE PLATFORM_DATAATTRIBUTES (
        PLATFORMDATAATTRIBUTES_ID INTEGER,
        DATAATTRIBUTE_NAME STRING,
        SENSITIVITYFLAG_ID INTEGER,
        CREATED_DATE DATE,
        STATUS_ID INTEGER,
        CREATED_USER STRING,
        PLATFORM_DATAATTRIBUTE_GUID STRING,
        REGISTERED_APP STRING,
        PLATFORM_TABLE_NAME STRING,
        ATTRIBUTE_TYPE STRING
);
ALTER TABLE PLATFORM_DATAATTRIBUTES ADD CONSTRAINT xpk_PLATFORM_DATAATTRIBUTES PRIMARY KEY (PLATFORM_DATAATTRIBUTES_ID);

DROP TABLE IF EXISTS PLATFORM_DATAGENERATION;
CREATE TABLE PLATFORM_DATAGENERATION (
        DATAGENTYPE_ID INTEGER,
        DATAGENTYPE_DESCRIPTION STRING,
        DEFINITION STRING,
        DATAATTRIBUTE_ID INTEGER,
        CREATED_DATE DATE,
        STATUS_ID INTEGER,
        CREATED_USER STRING,
        QUANTITY INTEGER,
        MAXRECORDSINSOURCE INTEGER,
        REGISTERED_APP STRING,
        ORGANIZATION_GUID STRING
);
ALTER TABLE PLATFORM_DATAGENERATION ADD CONSTRAINT xpk_PLATFORM_DATAGENERATION PRIMARY KEY (DATAGENTYPE_ID);