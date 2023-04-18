USE ZOPHIAFLIX;

--Catalogo Pais
CREATE OR REPLACE STAGE catalogo_pais
file_format = (type= 'CSV', skip_header= 1);

PUT file:///data/catalogo_pais.csv @catalogo_pais PARALLEL= 16;


COPY INTO ZOPHIAFLIX.PUBLIC.CATALOGO_PAIS FROM @catalogo_pais;

-- IP Location
CREATE OR REPLACE STAGE ip_location
file_format = (type= 'CSV', skip_header= 1);

PUT file:///data/ip_location.csv @ip_location PARALLEL= 16;

COPY INTO ZOPHIAFLIX.PUBLIC.IP_LOCATION FROM @ip_location ON_ERROR='CONTINUE';

--Zophiaflix Catalog
CREATE OR REPLACE STAGE zophiaflix_catalog
file_format = (type= 'CSV', skip_header= 1, FIELD_OPTIONALLY_ENCLOSED_BY='"');

PUT file:///data/zophiaflix_catalog.csv @zophiaflix_catalog PARALLEL= 16;

COPY INTO ZOPHIAFLIX.PUBLIC.ZOPHIAFLIX_CATALOGO FROM @zophiaflix_catalog;

--Zophiaflix Logs
CREATE OR REPLACE STAGE zophiaflix_logs
file_format = (type= 'CSV', skip_header= 1, FIELD_OPTIONALLY_ENCLOSED_BY='"');

PUT file:///data/zophiaflix_logs.csv @zophiaflix_logs PARALLEL= 16;

COPY INTO ZOPHIAFLIX.PUBLIC.ZOPHIAFLIX_LOGS FROM @zophiaflix_logs;

--Zophiaflix Users
CREATE OR REPLACE STAGE zophiaflix_users
file_format = (type= 'CSV', skip_header= 1, FIELD_OPTIONALLY_ENCLOSED_BY='"');

PUT file:///data/zophiaflix_users.csv @zophiaflix_users;

COPY INTO ZOPHIAFLIX.PUBLIC.USERS_CSV FROM @zophiaflix_users;