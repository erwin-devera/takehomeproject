WITH cte_policy_lifetime AS (
  SELECT  start_date, 
          end_date, 
          DATE_DIFF(end_date, start_date, DAY) policy_duration, 
          product_type, 
          channel,
          status 
  FROM {{ source('iag', 'policies') }} 
  WHERE status IN ('Cancelled', 'Lapsed')
)

SELECT  
  --status,
  product_type, 
  channel, 
  SAFE_CAST(AVG(policy_duration) AS INT64) avg_policy_lifetime,
  AVG(policy_duration) avg_policy_duration
FROM cte_policy_lifetime
GROUP BY 
  --status,
  product_type, 
  channel
ORDER BY
  --status,
  product_type,
  channel