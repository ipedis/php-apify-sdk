DC := docker compose exec app

.PHONY: up down install update test coverage phpstan pint pint-check rector rector-check qa shell quality

up:
	docker compose up -d --build

down:
	docker compose down

install: up
	$(DC) composer install --prefer-dist --no-interaction --no-progress

update: up
	$(DC) composer update --prefer-dist --no-interaction --no-progress

test: up
	$(DC) composer test

coverage: up
	$(DC) composer test:coverage

phpstan: up
	$(DC) composer phpstan

pint: up
	$(DC) composer pint

pint-check: up
	$(DC) composer pint:check

rector: up
	$(DC) composer rector

rector-check: up
	$(DC) composer rector:check

qa: up
	$(DC) composer qa

shell: up
	docker compose exec app /bin/sh

quality: up rector pint phpstan test
