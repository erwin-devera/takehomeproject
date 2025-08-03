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
  product_type, 
  channel,
  AVG(policy_duration) avg_policy_duration
FROM cte_policy_lifetime
GROUP BY 
  product_type, 
  channel
ORDER BY
  product_type,
  channel