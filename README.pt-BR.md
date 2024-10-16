[English](README.md) | [Português](README.pt-BR.md)

# Airflow Lab

Este repositório contém um ambiente de laboratório para experimentos com o Airflow usando Docker.

## Inicialização

1. No diretório raiz do projeto, execute:

    ```sh
    make airflow-init
    ```

2. Acesse a interface do Airflow em [http://localhost:8080](http://localhost:8080).

> O nome de usuário e a senha padrão são `airflow`. Você pode alterar esses valores substituindo as variáveis `_AIRFLOW_WWW_USER_USERNAME` e `_AIRFLOW_WWW_USER_PASSWORD` no arquivo `docker-compose.yaml`.

## Deploy de DAGs

Para executar seu DAG no Airflow, adicione o script do DAG na pasta `dags`. Em seguida, você verá o DAG na interface do Airflow.

## Exemplos de DAGs

Alguns scripts de DAGs criados durante este estudo estão na pasta `examples`. Para utilizá-los, você pode executar os comandos `make ex<numero_do_exemplo>` para configurar o exemplo e verificar se o script está correto. Por exemplo, o `make ex04` copiará o arquivo `examples/test04.py` para `dags` e verificará se o script não gera exceção.

## Funcionalidades adicionais

- **Exibir informações do Airflow:**

    ```sh
    make info
    ```

- **Listar todos os DAGs:**

    ```sh
    make list-dags
    ```

- **Listar as tasks de um DAG:**

    ```sh
    make list-tasks dag=<nome_da_dag>
    ```

- **Testar uma task específica:**

    ```sh
    make test-task dag=<nome_da_dag> task=<nome_da_task>
    ```

- **Verificar um script de DAG:**

    ```sh
    make check script=<nome_do_script.py>
    ```

- **Remover o serviço airflow-lab e todos os arquivos/pastas relacionados:**

    ```sh
    make clean
    ```

- **Parar os serviços do Airflow Lab:**

    ```sh
    make stop
    ```

- **Iniciar ou reiniciar o serviço:**

    ```sh
    make start
    ```

- **Executar um terminal Bash interativo no container Airflow (worker):**

    ```sh
    make bash
    ```
