{% test not_null_valid_date(model, column_name) %}
    SELECT
    *
    FROM
        {{ model }}
    WHERE
        safe_cast({{ column_name}} as date) is null 
        and {{ column_name}} is not null
{% endtest %}