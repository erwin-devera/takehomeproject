SELECT  
    pe.event_type,
    pe.policy_id,
    pe.event_date,
    pe.channel_override,
    e.customer_id,
    e.policy_start_date,
    e.policy_end_date,
    e.underwriter_id,
    e.underwriter_name,
    e.policy_status,
    e.product_type,
    e.channel
FROM {{ ref('stg_policy_events') }} pe
    INNER JOIN {{ ref('int_enrichment_info')}} e
        ON pe.policy_id = e.policy_id