.DEFAULT_GOAL := help

init:
	docker-compose run --rm web rails new . -d postgresql --skip-bundle --skip-coffee --skip-turbolinks --skip-sprockets
	docker-compose run --rm web bundle install --without production
	docker-compose run --rm web bundle exec rails db:create
	docker-compose run --rm web bundle exec rails db:migrate

initdb:
	docker-compose run --rm web bundle exec rails db:create
	docker-compose run --rm web bundle exec rails db:migrate

bundle-install:
	docker-compose run --rm web bundle install

resetdb:
	docker-compose run --rm web bundle exec rails db:migrate:reset

serve: up attach ## Run Serve

fixture:
	docker-compose run --rm web bundle exec rails db:fixtures:load

up: ## Run web container
	docker-compose up -d web

console: ## Run Rails Console
	docker-compose run --rm web bundle exec rails c

attach: ## Attach running web container for binding.pry
	docker attach `docker ps -f name=rails-laravel-mix_web -f status=running --format "{{.ID}}"`

yarn_install: ## Run yarn install
	docker-compose run --rm yarn install

yarn_dev: ## Run yarn run dev
	docker-compose run --rm yarn run dev

yarn_watch: ## Run yarn watch
	docker-compose run --rm yarn run watch

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

