CREATE OR REPLACE FUNCTION transform_ip(ip varchar)
    returns number
    as
    $$
    get_path(parse_ip(ip,'INET'),'ip_fields[0]')::int
    $$
;

SHOW USER FUNCTIONS;

DESCRIBE FUNCTION transform_ip(varchar);

SELECT transform_ip(ip) as ip_value
FROM zophiaflix_logs
LIMIT 100;