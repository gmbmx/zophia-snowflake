-- Database and Table Creations
CREATE DATABASE IF NOT EXISTS ZOPHIAFLIX;

USE ZOPHIAFLIX;

CREATE OR REPLACE TABLE public.zophiaflix_logs (
    ip VARCHAR(20) NOT NULL,
    fecha VARCHAR(50) NOT NULL,
    rowid VARCHAR(100) NOT NULL,
    show_name VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    flix_id INT NOT NULL,
    usuario_id VARCHAR(40) NOT NULL,
    dispositivo VARCHAR(180) NOT NULL,	
	tiempo_visto FLOAT4,    
    _airbyte_ab_id VARCHAR(60),
    _airbyte_emitted_at TIMESTAMP_LTZ
	);


CREATE OR REPLACE TABLE public.zophiaflix_catalogo (
	zfid INT NOT NULL,
    yearrelease INT NOT NULL,
    rowid VARCHAR(100),    
    title VARCHAR(100) NOT NULL,
    vtype VARCHAR(10) NOT NULL,
    imdbid VARCHAR(10) NOT NULL,
	poster VARCHAR(250) NOT NULL,
	top250 VARCHAR(5) NOT NULL,
    runtime FLOAT NOT NULL,
	synopsis VARCHAR(500) NOT NULL,
    top250tv FLOAT NOT NULL,
	avgrating FLOAT NOT  NULL,
    titledate VARCHAR(10) NOT NULL,	
	imdbrating VARCHAR(5) NOT NULL,	
	countrycode VARCHAR(612) NOT NULL,	
    _airbyte_ab_id VARCHAR(60),
    _airbyte_emitted_at TIMESTAMP_LTZ
);

CREATE OR REPLACE TABLE public.catalogo_pais (
	zfid FLOAT NOT NULL,
	countrycode VARCHAR(2) NOT NULL
);

CREATE OR REPLACE TABLE public.ip_location (
	IPend INT NOT NULL,
    rowid VARCHAR(100),
    IPstart INT NOT NULL,
	countrycode VARCHAR(2) NOT NULL,
	countryname VARCHAR(60) NOT NULL,
	_airbyte_ab_id VARCHAR(50),
    _airbyte_emitted_at TIMESTAMP_LTZ
);

CREATE OR REPLACE TABLE public.users_csv (
	pais VARCHAR(2) NOT NULL,
    plan VARCHAR(15) NOT NULL,
    rowid VARCHAR(100),
    correo VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,	
	antiguedad VARCHAR(10) NOT NULL,	
	costo_plan FLOAT NOT NULL,
	usuario_id VARCHAR(100) NOT NULL,
    _airbyte_ab_id VARCHAR(50),
    _airbyte_emitted_at TIMESTAMP_NTZ
	
        
);