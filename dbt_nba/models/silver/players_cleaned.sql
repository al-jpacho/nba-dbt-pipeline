with source_data as (
    select *
    from {{ ref('players') }}
)

select
    PERSON_ID::int as player_id,
    DISPLAY_FIRST_LAST as full_name,
    IS_ACTIVE::boolean as is_active,
    FROM_YEAR::int as career_start_year,
    TO_YEAR::int as career_end_year,
    TEAM_ID::int as team_id,
    TEAM_NAME as team_name,
    TEAM_CITY as team_city,
from source_data
