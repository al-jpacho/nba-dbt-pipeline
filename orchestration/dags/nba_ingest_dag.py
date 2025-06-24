from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

DEFAULT_ARGS = {
    "owner": "aljpacho",
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    dag_id="nba_data_ingestion",
    default_args=DEFAULT_ARGS,
    description="Run nba_api ingestion script and store in DuckDB",
    schedule_interval=None,
    start_date=datetime(2024, 6, 1),
    catchup=False,
    tags=["nba", "ingestion", "duckdb", "dbt"],
) as dag:
    
    ingest_nba_data = BashOperator(
        task_id="run_ingest_script",
        bash_command="python /opt/airflow/dags/../../scripts/ingest_nba_data.py"
    )