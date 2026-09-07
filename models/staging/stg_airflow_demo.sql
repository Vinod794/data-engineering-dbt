{{ config(materialized='view') }}

select
    id,
    trim(name) as name
from {{ source('airflow', 'airflow_demo') }}
