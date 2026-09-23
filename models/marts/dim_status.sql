{{ config(materialized='table') }}

select
    status_code,
    status_name
from {{ ref('status_mapping') }}
