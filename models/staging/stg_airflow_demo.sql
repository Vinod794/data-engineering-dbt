{{ config(materialized='view') }}

select
    id,
    trim(name) as name,
    updated_at
from {{ source('airflow', 'airflow_demo') }}
