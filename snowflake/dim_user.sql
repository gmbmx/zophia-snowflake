USE ZOPHIAFLIX;

CREATE OR REPLACE TABLE ZOPHIAFLIX.DWH.DIM_USER(
    user_id varchar(100),
    name varchar(100),
    email varchar(100),
	phone varchar(100),
    country varchar(100),
    membership_start_date date,
    plan_id varchar(60),
    current_user_flag boolean,
    user_start_date timestamp comment 'insert date', 
    user_end_date timestamp comment 'update date',
    CONSTRAINT pkey_0 PRIMARY KEY (user_id)
);

INSERT INTO ZOPHIAFLIX.DWH.DIM_USER(
    user_id,
    name,
    email,
    phone,
    country,
    membership_start_date,
    plan_id,
    current_user_flag,
    user_start_date,
    user_end_date
    )

SELECT DISTINCT 
    usuario_id,
    nombre,
    correo,
    NULL,
    pais,
    to_date(antiguedad, 'mon YYYY'),
    replace(regexp_substr(plan,'\'(.*?)\''),'\'',''),
    TRUE,
    current_timestamp(),
    NULL
FROM ZOPHIAFLIX.PUBLIC.USERS_CSV 
QUALIFY row_number() OVER(PARTITION BY correo order BY antiguedad) = 1;