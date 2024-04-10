ifneq (,$(wildcard scripts/deploy/local/.env))
	include scripts/deploy/local/.env
	export $(shell sed 's/=.*//' scripts/deploy/local/.env)
endif

.PHONY: init start stop down

init:
	cp ./scripts/deploy/local/.example.env ./scripts/deploy/local/.env

start:
	docker compose -p auctions-dev-environment --profile $(filter-out $@,$(MAKECMDGOALS)) -f ./scripts/deploy/local/docker-compose.yml up --build -d
%:
	@:

stop:
	docker compose -p auctions-dev-environment --profile $(filter-out $@,$(MAKECMDGOALS)) -f scripts/deploy/local/docker-compose.yml stop
%:
	@:

down:
	docker compose -p auctions-dev-environment --profile all -f scripts/deploy/local/docker-compose.yml down --remove-orphans
