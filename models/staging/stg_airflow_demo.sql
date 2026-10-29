{% set name_column = 'name' %}

{{ config(materialized='view') }}

select
    id,

    {% if var('normalize_names', true) %}
        {{ clean_text(name_column) }}
    {% else %}
        {{ name_column }}
    {% endif %} as name,

    updated_at

from {{ source('airflow', 'airflow_demo') }}
