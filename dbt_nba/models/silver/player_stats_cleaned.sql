with source_data as (
    select *
    from {{ ref('player_stats') }}
)

select
    PLAYER_ID::int as player_id,
    PLAYER_NAME as player_name,
    TEAM_ID as team_id,
    TEAM_ABBREVIATION as team_abbreviation,
    PTS::float as points_per_game,
    AST::float as assists_per_game,
    REB::float as rebounds_per_game,
    FG_PCT::float as field_goal_percentage,
    PLUS_MINUS::float as plus_minus_score,
    GP::int as games_played,
    MIN::float as minutes_per_game,
    SEASON
from source_data
where GP > 0