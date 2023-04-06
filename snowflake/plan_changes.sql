CREATE OR REPLACE TABLE ZOPHIAFLIX.PUBLIC.plan_change(
    plan_name VARCHAR(15),
    plan_cost FLOAT,
    product_name VARCHAR(60),
	country_code VARCHAR(2),
    plan_date DATE
);

CREATE OR REPLACE TABLE ZOPHIAFLIX.PUBLIC.plan(
    plan_sk VARCHAR(60),
    plan_name VARCHAR(15),
    plan_cost FLOAT,
    product_name VARCHAR(60),
	country_code VARCHAR(2),
    plan_date_start DATE,
    plan_date_end DATE,
    current_plan_flag BOOLEAN
);

INSERT INTO plan_change(
    plan_name,
    plan_cost,
    country_code,
    product_name,
    plan_date
)

WITH zophiaflix_plan AS
(
    SELECT DISTINCT 
        regexp_replace(plan,'[^a-zA-Z0-9]+','') as plan_name,
        costo_plan as plan_cost,
        pais as country_code
    FROM users_csv
    WHERE country_code IN('AR','MX','CO')
    ORDER BY country_code,plan_name
)

SELECT 
    plan_name,
    round(plan_cost*1.15,2) as plan_cost,
    country_code,
    'zophiaflix' as product_name,
    current_date() as plan_date    
FROM zophiaflix_plan;