USE ZOPHIAFLIX;

INSERT INTO ZOPHIAFLIX.DWH.DIM_PLAN(
    plan_id,
    plan_name,
    plan_cost,
    product_name,
	country_code,
    plan_start_date,
    plan_end_date,
    current_plan_flag
)

WITH zophiaflix_plan AS
(
    SELECT DISTINCT 
        regexp_replace(plan,'[^a-zA-Z0-9]+','') as plan_name, 
        costo_plan as plan_cost,
        pais as country_code
    FROM users_csv
    ORDER BY country_code,plan_name
)

SELECT 
    uuid_string() as plan_id,
    plan_name,
    plan_cost,
    'zophiaflix' as product_name,
    country_code,
    current_date()-8 as plan_start_date,
    NULL as plan_end_date,
    TRUE as current_plan_flag
FROM zophiaflix_plan;

