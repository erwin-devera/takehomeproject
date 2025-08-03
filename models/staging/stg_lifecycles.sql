/*
SELECT col1, col2, col3, lifecycle, 'AU' country_code FROM raw_lifecycle_au --did not use source jinja func because it does not exists in the sources.yml (throws an error)
UNION ALL
SELECT col1, col2, col3, lifecycle, 'NZ' country_code FROM raw_lifecycle_nz --did not use source jinja func because it does not exists in the sources.yml (throws an error)
*/