import pandas as pd
from nba_api.stats.endpoints import commonallplayers, leaguedashplayerstats

import duckdb


def fetch_player_metadata() -> pd.DataFrame:
    """
    Fetch all NBA player metadata from the NBA API.

    Returns:
        pd.DataFrame: DataFrame containing metadata for all players.
    """
    player_data = commonallplayers.CommonAllPlayers(is_only_current_season=0)
    return pd.DataFrame(player_data)


def fetch_player_stats(season: str = "2024-25") -> pd.DataFrame:
    """
    Fetch player statistics for a given NBA season.

    Args:
        season (str): Season in 'YYYY-YY' format. Defaults to '2024-25'.

    Returns:
        pd.DataFrame: DataFrame with season player statistics.
    """
    stats = leaguedashplayerstats.LeagueDashPlayerStats(season=season)
    df_stats = stats.get_data_frames()[0]
    return df_stats


def load_to_duckdb(
    df_players: pd.DataFrame,
    df_player_stats: pd.DataFrame,
    db_path: str = "../duckdb/nba.duckdb",
):
    """
    Load player metadata and stats into DuckDB under the raw schema.

    Args:
        df_players (pd.DataFrame): Player metadata DataFrame.
        df_player_stats (pd.DataFrame): Player statistics DataFrame.
        db_path (str): Path to the DuckDB database file.
    """
    sql_raw_players = """
    create or replace table raw.players as
    select * from df_players
    """

    sql_raw_player_stats = """
    create or replace table raw.player_stats as
    select * from df_player_stats
    """

    with duckdb.connect(db_path) as con:
        con.execute("create schema if not exists raw")
        con.execute(sql_raw_players)
        con.execute(sql_raw_player_stats)


if __name__ == "__main__":
    print("Fetching player metadata...")
    df_players = fetch_player_metadata()

    print("Fetching player stats for 2024–25 season...")
    df_player_stats = fetch_player_stats()

    print("Loading data into DuckDB...")
    load_to_duckdb(df_players, df_player_stats)

    print("Raw data ingestion complete.")
