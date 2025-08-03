/*
{{
    config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}

 
Query to select from {{ ref('stg_policies') }} and join with the related dimension 
tables to get the SK

{% if is_incremental() %}
    AND policy_id > (select max(policy_id) from {{ this }})
{% endif %}
*/