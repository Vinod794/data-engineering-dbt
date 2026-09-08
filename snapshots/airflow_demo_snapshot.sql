{% snapshot airflow_demo_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select
    id,
    name,
    updated_at
from {{ source('airflow', 'airflow_demo') }}

{% endsnapshot %}
