import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator


ex = DAG(
    dag_id="ex01",
    description="Print date.",
    schedule=None,
    tags=["example"]
)
BashOperator(task_id="print_date", dag=ex01, bash_command="date")
