COLOR_GREEN = \\033[32m
COLOR_RED = \\033[31m
COLOR_RESET = \\033[0m

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

airflow-info:
	docker compose exec airflow-worker airflow info

airflow-bash:
	docker exec -it airflow-worker bash

airflow-check:
	@docker exec airflow-worker python /opt/airflow/dags/$(script)
	@if [ $$? -eq 0 ]; then \
		echo "${COLOR_GREEN}Script $(script) is OK!${COLOR_RESET}"; \
	fi

airflow-example:
	cp examples/$(script) dags/
	$(MAKE) airflow-check script=$(script)