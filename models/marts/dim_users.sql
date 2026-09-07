{{ config(materialized='table') }}

select
    id as user_id,
    name as user_name
from {{ ref('stg_airflow_demo') }}
