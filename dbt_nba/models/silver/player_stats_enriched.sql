with stats as (
    select *
    from {{ ref('player_stats_cleaned') }}
),
players as (
    select *
    from {{ ref('players_cleaned') }}
)
select
    stats.player_id,
    players.full_name,
    players.is_active,
    players.career_start_year,
    players.career_end_year,
    players.team_id,
    players.team_name,
    players.team_city,
    stats.team_abbreviation,
    stats.points_per_game,
    stats.assists_per_game,
    stats.rebounds_per_game,
    stats.field_goal_percentage,
    stats.plus_minus_score,
    stats.games_played,
    stats.minutes_per_game
from stats
left join players
    on stats.player_id = players.player_id
