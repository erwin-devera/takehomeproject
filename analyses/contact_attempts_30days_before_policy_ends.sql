WITH cte_contact_attempts AS (
  SELECT  p.policy_id, 
          p.end_date as policy_end_date, 
          pe.event_date as contact_attempt_date, 
          DATE_DIFF(p.end_date, pe.event_date, DAY) days_remaining_before_policy_ends, 
          event_type
  FROM {{ source('iag', 'policies') }} p
    INNER JOIN {{ source('iag', 'policy_events') }} pe
      ON p.policy_id = pe.policy_id
  WHERE pe.event_type = 'contact_attempt'
),

cte_filtered_contact_attempts AS (
  SELECT 
    policy_id, 
    policy_end_date, 
    contact_attempt_date, 
    days_remaining_before_policy_ends, 
    event_type 
  FROM cte_contact_attempts 
  WHERE 
    contact_attempt_date < policy_end_date --contact attempt date is BEFORE policy end date
    AND days_remaining_before_policy_ends <= 30 --contact attemp is within 30 days from policy end date
)

SELECT
  COUNT(1) count_of_contact_attempts_within_30days_before_policy_ends
FROM cte_filtered_contact_attempts
