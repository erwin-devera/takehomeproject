WITH enrichment_info AS ( 
    SELECT  p.policy_id,
            p.customer_id,
            p.policy_start_date,
            p.policy_end_date,
            p.underwriter_id,
            u.underwriter_name,
            p.policy_status,
            p.product_type,
            p.channel
    FROM {{ ref('stg_policies') }} p
        INNER JOIN {{ ref('stg_underwriters')}} u
            ON p.underwriter_id = u.underwriter_id
)

SELECT 
    policy_id,
    customer_id,
    policy_start_date,
    policy_end_date,
    underwriter_id,
    underwriter_name,
    policy_status,
    product_type,
    channel
FROM enrichment_info 