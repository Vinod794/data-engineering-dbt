{{ config(
    materialized='incremental',
    unique_key='user_id'
) }}

with source_data as (

    select
        id as user_id,
        name as user_name,
        updated_at
    from {{ ref('stg_airflow_demo') }}

{% if is_incremental() %}

),

latest_target as (

    select
        coalesce(max(updated_at), '1900-01-01'::timestamp) as max_updated_at
    from {{ this }}

{% endif %}

)

select
    s.user_id,
    s.user_name,
    s.updated_at
from source_data s

{% if is_incremental() %}

cross join latest_target t
where s.updated_at >= t.max_updated_at - interval '1 hour'

{% endif %}
