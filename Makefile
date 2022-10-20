.EXPORT_ALL_VARIABLES:

DEBEZIUM_VERSION = 2.0

.PHONY: up
up:
	@docker compose up -d

.PHONY: down
down:
	@docker compose down --volumes --remove-orphans

.PHONY: mysql
mysql:
	@docker compose exec mysql bash -c 'mysql -u $$MYSQL_USER  -p$$MYSQL_PASSWORD inventory'

.PHONY: ping
ping:
	@curl -H "Accept:application/json" localhost:8083/

.PHONY: check-connect
check-connect:
	@curl -H "Accept:application/json" localhost:8083/connectors/

.PHONY: watch
watch:
	@docker compose logs watcher