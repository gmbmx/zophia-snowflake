SELECT 
    dispositivo,
    CASE
        WHEN regexp_count(dispositivo, 'iPhone|Android')>0 then 'Mobile'
        WHEN regexp_count(dispositivo, 'Mozilla|Macintosh|Opera')>0 then 'Desktop'
        WHEN contains(dispositivo, 'iPad') then 'Tablet'
        ELSE 'Unknown'
    END identificador,
    CASE 
        WHEN regexp_count(dispositivo,'(Mobile|iP(hone|od|ad)|Android|Linux)')>0 then regexp_extract_all(dispositivo, '(Mobile|iP(hone|od|ad)|Android|Linux)')
        ELSE array_construct(dispositivo)
    END identificador_1,
    regexp_substr(dispositivo, '^[A-Za-z]+',1) as identificador_2
FROM zophiaflix_logs;

SELECT
        CAST(fecha as DATE) AS view_date,
        CAST(rowid as INT) AS row_id,
        show_name,
        ubicacion AS location,
        CAST(flix_id AS INT) as zophiaflix_content_id,
        usuario_id as zophiaflix_user_id,
        dispositivo AS device,
        ip as device_ip,
        tiempo_visto AS view_time_mins,
        _airbyte_ab_id AS airbyte_ab_id,
        _airbyte_emitted_at AS airbyte_loaded_at_timestamp
  FROM zophiaflix_logs
  LIMIT 10;
  
  SELECT * FROM users_csv  LIMIT 10;
  
  SELECT
        pais as country,
        plan as zophiaflix_plan,
        correo as email,
        nombre as full_name,
        to_date(antiguedad,'MON YYYY') as membership_seniority,
        costo_plan as zophiaflix_plan_cost,
        usuario_id as zophiaflix_user_id
   FROM users_csv
  LIMIT 10;
  
  SELECT
        CAST(rowid as INT) as row_id,     
        CAST(ipstart as INT) as ip_range_start,
        CAST(ipend as INT) as ip_range_end,
        REPLACE(countrycode,'-','') as country_code,
        countryname as country_name,
        _airbyte_ab_id as airbyte_ab_id,
        _airbyte_emitted_at as airbyte_loaded_at
  FROM ip_location LIMIT 10;
  
  --Hace falta limpiar y estandarizar catalogo pais y zophiaflix catalogo