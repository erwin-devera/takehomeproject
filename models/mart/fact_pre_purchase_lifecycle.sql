/*
SELECT *
FROM {{ ref('stg_lifecycles') }}
WHERE lifecycle = 'pre-purchase'
*/