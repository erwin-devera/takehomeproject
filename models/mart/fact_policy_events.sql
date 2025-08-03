/*
{{
    config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}

Query to select from {{ ref('stg_policy_events') }} and join with the related dimension 
tables to get the SK

{% if is_incremental() %}
    AND event_date > (select max(event_date) from {{ this }})
{% endif %}
*/