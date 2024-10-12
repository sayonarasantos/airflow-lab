from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator
from datetime import datetime
import os
from docker.types import Mount


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 10, 10),
}

with DAG(
    dag_id="test03",
    description="Wine model (docker test)",
    schedule=None,
    default_args=default_args,
    tags=["example"],
) as dag:

    collect_data = DockerOperator(
        task_id='collect_data',
        image='custom-python',
        command="python test03-collect-data.py",
        docker_url='unix://var/run/docker.sock',
        network_mode='airflow-lab',
        mount_tmp_dir=False,
        auto_remove='success',
    )
