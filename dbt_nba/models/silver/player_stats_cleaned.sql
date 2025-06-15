with source_data as (
    select *
    from {{ ref('player_stats') }}
)

select
    player_id::int,
    player_name,
    team_abbreviation,
    pts::float as points_per_game,
    ast::float as assists_per_game,
    reb::float as  rebounds_per_game,
    fg_pct::float field_goal_percentage,
    plus_minus::float as plus_minus_score,
    gp::int as games_played,
    min::float as minutes_per_game,
    season
from source_data
where gp > 0