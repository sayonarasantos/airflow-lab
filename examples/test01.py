import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator


test01 = DAG(
    dag_id="test01",
    description="Print date.",
    schedule=None,
    tags=["example"]
)
BashOperator(task_id="print_date", dag=test01, bash_command="date")
