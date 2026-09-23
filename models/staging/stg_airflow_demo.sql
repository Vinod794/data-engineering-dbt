{{ config(materialized='view') }}

select
    id,
    {{ clean_text('name') }} as name,
    updated_at
from {{ source('airflow', 'airflow_demo') }}
