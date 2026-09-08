select
    user_id
from {{ ref('dim_users') }}
where user_id <= 0
