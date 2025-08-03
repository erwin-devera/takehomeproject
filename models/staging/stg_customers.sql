SELECT 
    customer_id, 
    risk_segment, 
    region, 
    acquisition_channel, 
    loyalty_score 
FROM {{ source('iag', 'customers') }}