-- Reference Data Tables
drop table if exists refdata_applications;
CREATE TABLE refdata_applications
(
    app_guid               char(38) default newid() NOT NULL,
    application_customcode varchar(15),
    application_desc       varchar(50),
    created_user           varchar(20),
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    vendor_id              char(38),
    industry_oid           varchar(49),
    organization_guid      char(38),
    PRIMARY KEY (app_guid)
);

drop table if exists refdata_codesets;
CREATE TABLE refdata_codesets
(
    codesets_id        char(38) default newid() NOT NULL,
    codeset_name       varchar(50),
    industry_std       varchar(6),
    status_id          INT      default 1,
    created_date       datetime DEFAULT (GETUTCDATE()),
    created_user       varchar(20),
    codeset_guid       char(38),
    field_mapping      varchar(40),
    sensitivityflag_id INT,
    externaltable_id   varchar(20),
    external_notes     varchar(149),
    external_link      varchar(99),
    PRIMARY KEY (codesets_id)
);

drop table if exists refdata_countries;
CREATE TABLE refdata_countries
(
    country_id   INT IDENTITY(1,1) NOT NULL,
    idd          varchar(5),
    country_name varchar(59),
    created_date datetime DEFAULT (GETUTCDATE()),
    status_id    INT      default 1,
    PRIMARY KEY (country_id)
);

drop table if exists refdata_dataattributes;
CREATE TABLE refdata_dataattributes
(
    dataattribute_id  INT IDENTITY(1,1) NOT NULL,
    dataattribute_name         varchar(50),
    sensitivityflag_id         integer,
    created_date              datetime DEFAULT (GETUTCDATE()),
    status_id                  integer     DEFAULT 1,
    created_user               varchar(20),
    platform_dataattribute_guid char(38),
    registeredapp_guid             char(38),
    attribute_type              varchar(10),
    PRIMARY KEY (dataattribute_id)
);

drop table if exists refdata_datastructures;
create table refdata_datastructures
(
    datastructure_id  INT IDENTITY(1,1) NOT NULL,
    datastructure_name          varchar(50),
    sensitivityflag_id          integer,
    created_date                datetime DEFAULT (GETUTCDATE()),
    status_id                   integer     default 1,
    created_user                varchar(20),
    platform_datastructures_guid char(38),
    registeredapp_guid              char(38),
    PRIMARY KEY (datastructure_id)
);

drop table if exists refdata_devicetypes;
CREATE TABLE refdata_devicetypes
(
    devicetype_id char(38) default newid() NOT NULL,
    devicetype    varchar(30),
    created_date  datetime DEFAULT (GETUTCDATE()),
    status_id     INT      default 1,
    PRIMARY KEY (devicetype_id)
);

drop table if exists refdata_industries;
CREATE TABLE refdata_industries
(
    industry_id   char(38) default newid() NOT NULL,
    industry_name varchar(45),
    created_date  datetime DEFAULT (GETUTCDATE()),
    status_id     INT      default 1,
    PRIMARY KEY (industry_id)
);

drop table if exists refdata_industries_business;
CREATE TABLE refdata_industries_business
(
    industrytobusiness_id char(38) default newid() NOT NULL,
    industry_id           char(38),
    business_area          varchar(50),
    created_date          datetime DEFAULT (GETUTCDATE()),
    status_id             INT      default 1,
    PRIMARY KEY (industrytobusiness_id)
);

drop table if exists refdata_industrystds;
CREATE TABLE refdata_industrystds
(
    industry_std     varchar(6) NOT NULL,
    industrystd_desc varchar(30),
    created_date     datetime DEFAULT (GETUTCDATE()),
    status_id        INT      default 1,
    PRIMARY KEY (industry_std)
);

drop table if exists refdata_industrystds_eventtypes;
CREATE TABLE refdata_industrystds_eventtypes
(
    eventtype_id     varchar(10) NOT NULL,
    eventtype_desc varchar(30),
    industry_std     varchar(6),
    created_date    datetime DEFAULT (GETUTCDATE()),
    status_id       INT      default 1,
    PRIMARY KEY (eventtype_id)
);

drop table if exists refdata_legalentities;
CREATE TABLE refdata_legalentities
(
    legalentity_guid char(38) default newid() NOT NULL,
    location_name    varchar(50),
    address          varchar(75),
    city             varchar(60),
    state_id         varchar(2),
    zipcode          varchar(12),
    created_user     varchar(20),
    status_id        INT      default 1,
    created_date     datetime DEFAULT (GETUTCDATE()),
    location_url     varchar(99),
    location_phone   varchar(12),
    PRIMARY KEY (legalentity_guid)
);

drop table if exists refdata_operationtypes;
CREATE TABLE refdata_operationtypes
(
    operationtype_id   varchar(7) NOT NULL,
    operationtype_name varchar(60),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    PRIMARY KEY (operationtype_id)
);

drop table if exists refdata_organizations;
CREATE TABLE refdata_organizations
(
    organization_guid          char(38) default newid() NOT NULL,
    organization_internal_code varchar(10),
    organization_internal_id   varchar(10),
    organization_name          varchar(50),
    address                    varchar(75),
    city                       varchar(60),
    state_id                   varchar(2),
    zipcode                    varchar(12),
    created_user               varchar(20),
    status_id                  INT      default 1,
    created_date               datetime DEFAULT (GETUTCDATE()),
    legalentity_guid           char(38),
    PRIMARY KEY (organization_guid)
);

drop table if exists refdata_professiontypes;
CREATE TABLE refdata_professiontypes
(
    professiontype_id  char(38) default newid() NOT NULL,
    professiontypename varchar(65),
    createduser        varchar(20),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    PRIMARY KEY (professiontype_id)
);

drop table if exists refdata_rulesets;
CREATE TABLE refdata_rulesets
(
    rule_id        char(38) default newid() NOT NULL,
    rule_name      varchar(65),
    created_user   varchar(20),
    created_date   datetime DEFAULT (GETUTCDATE()),
    status_id      INT      default 1,
    expirationdate datetime,
    PRIMARY KEY (rule_id)
);

drop table if exists refdata_sensitivityflags;
CREATE TABLE refdata_sensitivityflags
(
    sensitiveflag_id   INT IDENTITY(1,1) NOT NULL,
    sensitiveflag_desc varchar(30),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    PRIMARY KEY (sensitiveflag_id)
);

drop table if exists refdata_status;
CREATE TABLE refdata_status
(
    status_id          INT IDENTITY(1,1) NOT NULL,
    status_description varchar(45) NOT NULL,
    created_date       datetime,
    created_user       varchar(20),
    PRIMARY KEY (status_id)
);

drop table if exists refdata_terminologystds;
CREATE TABLE refdata_terminologystds
(
    terminology_std         varchar(25) NOT NULL,
    terminologystd_version varchar(10) NOT NULL,
    terminologystd_desc    varchar(129),
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    PRIMARY KEY (terminology_std)
);

drop table if exists refdata_timezones;
CREATE TABLE refdata_timezones
(
    timezone_value varchar(3) NOT NULL,
    timezone_desc  varchar(25),
    created_date   datetime DEFAULT (GETUTCDATE()),
    status_id      INT      default 1,
    PRIMARY KEY (timezone_value)
);

drop table if exists refdata_usstates;
CREATE TABLE refdata_usstates
(
    state_id          varchar(2) NOT NULL,
    state_description varchar(65),
    lattitude         varchar(12),
    longitude         varchar(12),
    created_date      datetime DEFAULT (GETUTCDATE()),
    status_id         INT      default 1,
    created_user      varchar(20),
    PRIMARY KEY (state_id)
);

drop table if exists refdata_vendors;
CREATE TABLE refdata_vendors
(
    vendor_id    char(38) default newid() NOT NULL,
    vendor_name   varchar(50),
    created_date datetime DEFAULT (GETUTCDATE()),
    status_id    INT      default 1,
    created_user  varchar(20),
    vendor_guid  char(38),
    PRIMARY KEY (vendor_id)
);

ALTER TABLE refdata_applications
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_applications
    ADD FOREIGN KEY (vendor_id)
        REFERENCES refdata_vendors (vendor_id);

ALTER TABLE refdata_applications
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE refdata_codesets
    ADD FOREIGN KEY (industry_std)
        REFERENCES refdata_industrystds (industry_std);

ALTER TABLE refdata_codesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_codesets
    ADD FOREIGN KEY (sensitivityflag_id)
        REFERENCES refdata_sensitivityflags (sensitiveflag_id);

ALTER TABLE refdata_countries
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industrystds_eventtypes
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industrystds_eventtypes
    ADD FOREIGN KEY  (industry_std)
        REFERENCES refdata_industrystds(industry_std);

ALTER TABLE refdata_industries
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industries_business
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_industries_business
    ADD FOREIGN KEY  (industry_id)
        REFERENCES refdata_industries(industry_id);

ALTER TABLE refdata_industrystds
    ADD FOREIGN KEY  (status_id)
        REFERENCES refdata_status(status_id);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_legalentities
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);

ALTER TABLE refdata_organizations
    ADD FOREIGN KEY (legalentity_guid)
        REFERENCES refdata_legalentities (legalentity_guid);

ALTER TABLE refdata_organizations
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_organizations
    ADD FOREIGN KEY (state_id)
        REFERENCES refdata_usstates (state_id);

ALTER TABLE refdata_professiontypes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_rulesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_sensitivityflags
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_terminologystds
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_timezones
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_usstates
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE refdata_vendors
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- Data Model

drop table if exists datamodel_apis;
CREATE TABLE datamodel_apis
(
    api_id             char(38) default newid(),
    technology         varchar(30),
    dataattributes_id  INT,
    baseurllocation    varchar(99),
    apiname            varchar(79),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    purpose            varchar(49),
    datmodel_tablename varchar(99),
    apiparams          varchar(59),
    apiexample         varchar(149),
    PRIMARY KEY (api_id)
);

ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists datamodel_domain;
CREATE TABLE datamodel_domain
(
    domainname        varchar(64) NOT NULL,
    domaininformation varchar(249),
    status_id         INT      default 1,
    created_date      datetime DEFAULT (GETUTCDATE()),
    PRIMARY KEY (domainname)
);
ALTER TABLE datamodel_domain
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop TABLE if exists datamodel_datatables;
CREATE TABLE datamodel_datatables
(
    tablename        varchar(64) NOT NULL,
    tableinformation varchar(249),
    status_id        INT      default 1,
    created_date     datetime DEFAULT (GETUTCDATE()),
    datadomain       varchar(64),
    PRIMARY KEY (tablename)
);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (datadomain)
        REFERENCES datamodel_domain (domainname);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

-- DataTier

drop table if exists datatier_crawlers;
CREATE TABLE datatier_crawlers
(
    datacrawler_id      char(38) default newid(),
    token               char(128),
    crawledtext_details text,
    created_date        datetime DEFAULT (GETUTCDATE()),
    status_id           int      DEFAULT 1,
    registeredapp_guid  char(38),
    organization_guid   char(38),
    PRIMARY KEY (datacrawler_id)
);

ALTER TABLE datatier_crawlers
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_crawlers
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_crawlers
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

drop table if exists datatier_sdp_dataattributes;
CREATE TABLE datatier_sdp_dataattributes
(
    datatier_id        char(38) default newid() NOT NULL,
    basevalue          varchar(99),
    supportingvalue1   varchar(169),
    supportingvalue2   varchar(50),
    supportingvalue3   varchar(50),
    supportingvalue4   varchar(50),
    supportingvalue5   varchar(50),
    supportingvalue6   varchar(50),
    supportingvalue7   varchar(50),
    created_date       datetime DEFAULT (GETUTCDATE()),
    status_id          INT      default 1,
    dataattribute_id   INT,
    created_user        varchar(20),
    registeredapp_guid char(38),
    datagentype_id     INT,
    PRIMARY KEY (datatier_id)
);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_sdp_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

drop table if exists datatier_sdp_datastructures;
CREATE TABLE datatier_sdp_datastructures
(
    datastructure_core_id char(38) default newid() NOT NULL,
    datastructure_name    varchar(29),
    datastructure_details text,
    created_date          datetime DEFAULT (GETUTCDATE()),
    status_id             INT      default 1,
    registeredapp_guid    char(38),
    PRIMARY KEY (datastructure_core_id)
);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_sdp_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

DROP TABLE if exists datatier_tokens;
CREATE TABLE datatier_tokens
(
    datatoken_id      char(38) default newid() NOT NULL,
    token              char(128),
    created_date       datetime    DEFAULT (GETUTCDATE()),
    status_id          INT         DEFAULT 1,
    registeredapp_guid char(38),
    organization_guid  char(38),
    intfc_type         varchar(10) DEFAULT 'API',
    datasource_id      char(38),
    PRIMARY KEY (datatoken_id)
);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

-- Platform

drop table if exists platform_codesets;
CREATE TABLE platform_codesets
(
    codeset_id  char(38) default newid() NOT NULL,
    application_guid    CHAR(38),
    organization_guid   CHAR(38),
    codesets_id  char(38),
    created_date        datetime DEFAULT (GETUTCDATE()),
    status_id           INT      default 1,
    created_user        varchar(20),
    originalcode_value  varchar(40),
    originalcode_desc   varchar(40),
    PRIMARY KEY (codeset_id)
);

ALTER TABLE platform_codesets
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_codesets
    ADD FOREIGN KEY (codesets_id)
        REFERENCES refdata_codesets (codesets_id);

drop table if exists platform_codesets_industrystd;
CREATE TABLE platform_codesets_industrystd
(
    termcodeset_id    char(38) default newid() NOT NULL,
    created_date      datetime DEFAULT (GETUTCDATE()),
    status_id         INT      default 1,
    code_value        varchar(20),
    code_desc         varchar(129),
    industry_std      varchar(6),
    terminology_std varchar(25),
    PRIMARY KEY (termcodeset_id)
);

ALTER TABLE platform_codesets_industrystd
    ADD FOREIGN KEY (terminology_std)
        REFERENCES refdata_terminologystds (terminology_std);

ALTER TABLE platform_codesets_industrystd
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_codesets_xmap;
CREATE TABLE platform_codesets_xmap
(
    codesetcrossmap_id  char(38) default newid() NOT NULL,
    application_guid    CHAR(38),
    organization_guid   CHAR(38),
    terminologystd_from   varchar(25),
    terminologystd_to   varchar(25),
    created_date        datetime DEFAULT (GETUTCDATE()),
    status_id           INT      default 1,
    created_user        varchar(20),
    transformcode_value varchar(40),
    transformcode_desc  varchar(129),
    originalcode_value  varchar(40),
    originalcode_desc   varchar(40),
    PRIMARY KEY (codesetcrossmap_id)
);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (terminologystd_from)
        REFERENCES refdata_terminologystds (terminology_std);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (terminologystd_to)
        REFERENCES refdata_terminologystds (terminology_std);

ALTER TABLE platform_codesets_xmap
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_datageneration_dataattributes;
CREATE TABLE platform_datageneration_dataattributes
(
    datagentype_id         char(38) default newid() NOT NULL,
    datagentype_description varchar(65),
    definition             varchar(255),
    dataattribute_id       INT,
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    createduser            varchar(20),
    quantity               int,
    maxrecords_in_source     int,
    registeredapp_guid     char(38),
    organization_guid      char(38),
    PRIMARY KEY (datagentype_id)
);


ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_datageneration_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_databuilding_dataattributes;
CREATE TABLE platform_databuilding_dataattributes
(
    databuild_dataattribute_id        char(38) default newid() NOT NULL,
    databuild_description varchar(65),
    definition             varchar(255),
    dataattribute_id       INT,
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    createduser            varchar(20),
    quantity               int,
    maxrecords_in_source     int,
    registeredapp_guid     char(38),
    organization_guid      char(38),
    param1  varchar(30),
    param1_operator varchar(7),
    param1_value varchar(65),
    param2  varchar(30),
    param2_operator varchar(7),
    param2_value varchar(65),
    param3  varchar(30),
    param3_operator varchar(7),
    param3_value varchar(65),
    param4  varchar(30),
    param4_operator varchar(7),
    param4_value varchar(65),
    PRIMARY KEY (databuild_dataattribute_id)
);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_databuilding_dataattributes
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

drop table if exists platform_databuilding_datastructures;
CREATE TABLE platform_databuilding_datastructures
(
    databuild_datastructures_id  char(38) default newid() NOT NULL,
    databuild_description varchar(65),
    definition             varchar(255),
    datastructure_id       INT,
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              INT      default 1,
    createduser            varchar(20),
    quantity               int,
    maxrecords_in_source     int,
    registeredapp_guid     char(38),
    organization_guid      char(38),
    PRIMARY KEY (databuild_datastructures_id)
);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_databuilding_datastructures
    ADD FOREIGN KEY (datastructure_id)
        REFERENCES  refdata_datastructures(datastructure_id)

drop table if exists platform_datasources;
create table platform_datasources
(
    platform_datasources_id char(38) default newid() NOT NULL,
    datasource_name        varchar(50) ,
    datasource_type        varchar(10),
    created_date           datetime DEFAULT (GETUTCDATE()),
    status_id              integer     default 1,
    created_user           varchar(20) ,
    organization_guid      char(38),
    registeredapp_guid         char(38),
    PRIMARY KEY (platform_datasources_id)
);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_datasources
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);
-- Added to ensure a reference to it occurs in table created well before in script
ALTER TABLE datatier_tokens
    ADD FOREIGN KEY (datasource_id)
        REFERENCES platform_datasources (platform_datasources_id);

drop table if exists platform_datastructures_dtl;
CREATE TABLE platform_datastructures_dtl
(
    platform_datastructuresdtl_id    char(38) default newid() NOT NULL,
    datastructure_id                     INT,
    composite_datastructure_name                   varchar(50),
    sensitivityflag_id                             INT,
    created_date                                   datetime DEFAULT (GETUTCDATE()),
    status_id                                      INT      default 1,
    createduser                                    varchar(20),
    platform_datastructures_to_dataattributes_guid char(38),
    registeredapp_guid                             char(38),
    dataattribute_id                     INT,
    PRIMARY KEY (platform_datastructuresdtl_id)
);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

ALTER TABLE platform_datastructures_dtl
    ADD FOREIGN KEY (datastructure_id)
        REFERENCES  refdata_datastructures(datastructure_id);

drop table if exists platform_rulesets_definitions;
CREATE TABLE platform_rulesets_definitions
(
    rulesetdefinitions_id  char(38) default newid() NOT NULL,
    rulesetdefinition_name varchar(50),
    ruleset_id             char(38),
    steporder_id           INT,
    operationtype_id       varchar(7),
    ruleset_defvalue       char(40),
    status_id              INT      default 1,
    created_date           datetime DEFAULT (GETUTCDATE()),
    effective_date         datetime,
    application_guid       char(38),
    term_date              datetime,
    dataattribute_id       INT,
    PRIMARY KEY (rulesetdefinitions_id)
);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (application_guid)
        REFERENCES refdata_applications (app_guid);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (ruleset_id)
        REFERENCES refdata_rulesets (rule_id);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES refdata_dataattributes (dataattribute_id);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (operationtype_id)
        REFERENCES refdata_operationtypes (operationtype_id);

ALTER TABLE platform_rulesets_definitions
    ADD FOREIGN KEY (status_id)
        REFERENCES refdata_status (status_id);

DROP TABLE if exists platform_tokens_xmaps;
CREATE TABLE platform_tokens_xmaps
(
    platform_tokens_xmap_id char(38) default newid() NOT NULL,
    datastructure_id           int,
    xmap_details                         varchar(149),
    dataattribute_id                     int      DEFAULT 1,
    fieldorder_id                        int      DEFAULT 1,
    created_date                         datetime DEFAULT (GETUTCDATE()),
    status_id                            int      DEFAULT 1,
    created_user                         varchar(20),
    registeredapp_guid                   char(38),
    organization_guid                    char(38),
    PRIMARY KEY (platform_tokens_xmap_id)
);

ALTER TABLE platform_tokens_xmaps
    ADD FOREIGN KEY (dataattribute_id)
        REFERENCES  refdata_dataattributes(dataattribute_id);

ALTER TABLE platform_tokens_xmaps
    ADD FOREIGN KEY (organization_guid)
        REFERENCES refdata_organizations (organization_guid);

ALTER TABLE platform_tokens_xmaps
    ADD FOREIGN KEY (registeredapp_guid)
        REFERENCES refdata_applications (app_guid);

-- Indexes
drop index if exists datatier_sdp_dataattributes_index on datatier_sdp_dataattributes;
create index datatier_sdp_dataattributes_index
    on datatier_sdp_dataattributes (datatier_id, basevalue, supportingvalue1, supportingvalue2, supportingvalue3, supportingvalue4,
                                    supportingvalue5, supportingvalue6, supportingvalue7, created_date, dataattribute_id,
                                    datagentype_id, status_id, created_user, registeredapp_guid);