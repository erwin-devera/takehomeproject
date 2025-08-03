{{
    config(
    materialized = 'incremental',
    unique_key = ['policy_id', 'event_type', 'event_date', 'channel_override'],
    on_schema_change = 'fail'
    )
}}

SELECT *
FROM {{ ref('int_all_enriched_events')}}
-- join to the different dims to get the SKs

{% if is_incremental() %}
-- only load new or changed rows based on event_date (assuming append-only)
where event_date > (select max(event_date) from {{ this }})
{% endif %}    