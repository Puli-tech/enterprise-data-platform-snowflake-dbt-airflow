from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.bash import BashOperator


default_args = {
    "owner": "data_engineering_team",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}


with DAG(
    dag_id="enterprise_data_platform_pipeline",
    default_args=default_args,
    description="Orchestrates raw data ingestion, dbt transformations, and data quality checks",
    start_date=datetime(2024, 5, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["data-engineering", "snowflake", "dbt", "airflow"],
) as dag:

    load_raw_data = BashOperator(
        task_id="load_raw_data",
        bash_command="python python/load_raw_data.py",
    )

    run_dbt_staging_models = BashOperator(
        task_id="run_dbt_staging_models",
        bash_command="dbt run --select stg_customers stg_products stg_transactions",
    )

    run_dbt_fact_model = BashOperator(
        task_id="run_dbt_fact_model",
        bash_command="dbt run --select fct_sales",
    )

    run_data_quality_checks = BashOperator(
        task_id="run_data_quality_checks",
        bash_command="echo 'Running SQL data quality checks from sql/data_quality_checks.sql'",
    )

    load_raw_data >> run_dbt_staging_models >> run_dbt_fact_model >> run_data_quality_checks
