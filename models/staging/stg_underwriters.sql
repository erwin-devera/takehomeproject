WITH stg_underwriters AS (
    SELECT 
        underwriter_id, 
        name, 
        license_status 
    FROM {{ source('iag', 'underwriters') }}
)

SELECT 
    underwriter_id, 
    name as underwriter_name,
    license_status 
FROM stg_underwriters