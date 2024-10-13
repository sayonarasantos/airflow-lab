COLOR_GREEN = \\033[32m
COLOR_RED = \\033[31m
COLOR_RESET = \\033[0m

init:
	mkdir -p ./dags ./logs ./plugins ./config
	echo "AIRFLOW_UID=$$(id -u)" > .env
	docker compose up --detach --build

clean:
	rm -R ./dags ./logs ./plugins ./config
	docker compose down --volumes --remove-orphans

start:
	@docker compose up --detach

stop:
	@docker compose down

info:
	@docker compose exec airflow-worker airflow info

bash:
	@docker exec -it airflow-worker bash

check:
	@docker exec airflow-worker python /opt/airflow/dags/$(script)
	@if [ $$? -eq 0 ]; then \
		echo "${COLOR_GREEN}Script $(script) is OK!${COLOR_RESET}"; \
	fi

list-dags:
	@docker exec -it airflow-worker airflow dags list

list-tasks:
	@docker exec -it airflow-worker airflow tasks list $(dag)

test-task:
	@docker exec -it airflow-worker airflow tasks test $(dag) $(task)

cp-example:
	@cp examples/$(script) dags/
	@$(MAKE) check script=$(script)

ex01:
	@$(MAKE) cp-example script=test01.py

ex02:
	@$(MAKE) cp-example script=test02.py

ex03:
	@docker image build -t custom-python examples/test03/
	@cp examples/test03/test03.py dags/
	@$(MAKE) check script=test03.py
