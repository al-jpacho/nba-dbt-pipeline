with source_data as (
    select *
    from {{ ref('players') }}
)

select
    person_id::int as player_id,
    display_first_last as full_name,
    is_active::boolean as is_active,
    from_year::int as career_start_year,
    to_year::int as career_end_year,
    team_name as team_name,
    team_city as team_city,
    team_id::int as team_id
from source_data
