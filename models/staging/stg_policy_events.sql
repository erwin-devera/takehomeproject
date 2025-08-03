SELECT 
    policy_id,
    event_type,
    event_date,
    channel_override 
FROM {{ source('iag', 'policy_events') }}

