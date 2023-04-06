INSERT INTO plan(
    plan_sk,
    plan_name,
    plan_cost,
    product_name,
	country_code,
    plan_date_start,
    plan_date_end,
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
    uuid_string() as plan_sk,
    plan_name,
    plan_cost,
    'zophiaflix' as product_name,
    country_code,
    current_date()-8 as plan_date_start,
    NULL as plan_date_end,
    TRUE as current_plan_flag
FROM zophiaflix_plan;