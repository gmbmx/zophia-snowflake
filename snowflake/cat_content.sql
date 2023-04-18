USE ZOPHIAFLIX;

CREATE OR REPLACE TABLE ZOPHIAFLIX.DWH.CAT_CONTENT (
    catalog_id INT NOT NULL,
	release_year INT NOT NULL,
	title VARCHAR(100) NOT NULL,
	content_type VARCHAR(10) NOT NULL,
	imdb_id VARCHAR(10) NOT NULL,
	poster TEXT NOT NULL,
	top250 VARCHAR(5) NOT NULL,
	runtime FLOAT NOT NULL,
	synopsis TEXT NOT NULL,
	top250_tv FLOAT NOT NULL,
	avg_rating FLOAT NOT NULL,
	title_date DATE NOT NULL,
	imdb_rating VARCHAR(5) NOT NULL,
	country_code ARRAY NOT NULL
);

INSERT INTO ZOPHIAFLIX.DWH.CAT_CONTENT (
    catalog_id,
	release_year,
	title,
	content_type,
	imdb_id,
	poster,
	top250,
	runtime,
	synopsis,
	top250_tv,
	avg_rating,
	title_date,
	imdb_rating,
	country_code)

SELECT 
        zfid,
        yearrelease,
        title,
        LOWER(vtype),
        imdbid,
	    poster,
	    REGEXP_REPLACE(top250,'[^0-9.]',''),
        runtime,
	    synopsis,
        top250tv,
	    avgrating,
        titledate,	
	    REGEXP_REPLACE(imdbrating,'[^0-9.]',''),	
	    SPLIT(REGEXP_REPLACE(countrycode,'[^A-Z,]',''),
			',') AS country_code
FROM ZOPHIAFLIX.PUBLIC.ZOPHIAFLIX_CATALOGO;

SELECT * FROM ZOPHIAFLIX.DWH.CAT_CONTENT LIMIT 10;