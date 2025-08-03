/*
WITH pre_purchase AS (
 --select required fields like account, date fields (date_diff), country_code, etc
),

underwriting AS (
 --select required fields like account, date fields (date_diff), country_code, etc
),

issuance AS (
--select required fields like account, date fields (date_diff), country_code, etc
),

active_policy_management AS (
--select required fields like policy, account, date fields (date_diff), country_code, etc
),

claims_management AS (
--select required fields like policy, account, date fields (date_diff), country_code, etc
)

SELECT 
    *   --in here, calculate metrics like for example date_diff of two dates 
        --or count of claims for a particular policy or account level or by country, etc
FROM 
    pre_purchase pp
    LEFT JOIN underwriting uw
        ON pp.account_id = uw.account_id
    LEFT JOIN issuance i
        ON uw.account_id = i.account_id
    LEFT JOIN active_policy_management apm
        ON i.policy_id = apm.policy_id
    LEFT JOIN claims_management cm
        ON apm.policy_id = cm.policy_id
*/