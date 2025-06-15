with base as (
    select *
    from {{ ref('player_stats_enriched') }}
),
top_ten_scorers as (
    select
        player_id,
        full_name,
        team_name,
        cast(round(points_per_game, 2) as decimal(5,2)) as points_per_game,
        games_played,
        '2024-2025' as season,
        rank() over (
            order by points_per_game desc
        ) as player_rank
    from base
)
select * 
from top_ten_scorers
where player_rank <= 10