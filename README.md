[English](README.md) | [Português](README.pt-BR.md)

# Airflow Lab

This repository contains a lab environment for experimenting with Airflow using Docker.

## Initialization

1. In the project root directory, run:

    ```sh
    make airflow-init
    ```

2. Access the Airflow UI at [http://localhost:8080](http://localhost:8080).

> The default username and password are `airflow`. You can change these values by overriding the `_AIRFLOW_WWW_USER_USERNAME` and `_AIRFLOW_WWW_USER_PASSWORD` variables in the `docker-compose.yaml` file.

## Deploying your DAGs

To run your DAG in Airflow, add the DAG script to the `dags` folder. After that, you will see your DAG in the Airflow UI.

## DAG Examples

Some DAG scripts created during this study are located in the `examples` folder. To use these examples, you can run the `make ex<example_number>` commands to configure the example and verify that the script is correct. For example, running `make ex04` will copy the `examples/ex04.py` file to `dags` and verify if the script does not raise an exception.

## Additional Features (make commands)

- **Show Airflow information:**

    ```sh
    make info
    ```

- **List DAGs:**

    ```sh
    make list-dags
    ```

- **List tasks in a specific DAG:**

    ```sh
    make list-tasks dag=<dag_name>
    ```

- **Test a specific task:**

    ```sh
    make test-task dag=<dag_name> task=<task_name>
    ```

- **Check a DAG script:**

    ```sh
    make check script=<file_name>
    ```

- **Remove the airflow-lab service and all associated files/folders:**

    ```sh
    make clean
    ```

- **Stop Airflow Lab services:**

    ```sh
    make stop
    ```

- **Start or restart the services:**

    ```sh
    make start
    ```

- **Run an interactive Bash terminal in the Airflow worker container:**

    ```sh
    make bash
    ```
