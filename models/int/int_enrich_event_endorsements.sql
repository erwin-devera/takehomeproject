WITH enrich_event_claims AS ( 
    SELECT  pe.event_type,
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
    WHERE pe.event_type = 'endorsement'
)

SELECT 
    event_type,
    policy_id,
    event_date,
    channel_override,
    customer_id,
    policy_start_date,
    policy_end_date,
    underwriter_id,
    underwriter_name,
    policy_status,
    product_type,
    channel
FROM enrich_event_claims 