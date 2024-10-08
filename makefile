airflow-init:
	mkdir -p ./dags ./logs ./plugins ./config
	echo -e "AIRFLOW_UID=$(id -u)" > .env
	docker compose up --detach

airflow-clean:
	rm -r ./dags ./logs ./plugins ./config
	docker compose down --volumes --remove-orphans

airflow-start:
	docker compose up --detach

airflow-stop:
	docker compose down