WITH stg_policies AS (
    SELECT 
        policy_id, 
        customer_id, 
        product_type, 
        channel, 
        start_date, 
        end_date, 
        status, 
        underwriter_id, 
        source_system 
    FROM {{ source('iag', 'policies') }}
)

SELECT 
        policy_id, 
        customer_id, 
        product_type, 
        channel, 
        start_date AS policy_start_date, 
        end_date AS policy_end_date, 
        status AS policy_status, 
        underwriter_id, 
        source_system 
    FROM stg_policies