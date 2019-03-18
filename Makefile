init:
	docker-compose run --rm web rails new . -d postgresql --skip-bundle --skip-coffee --skip-turbolinks --skip-sprockets
	docker-compose run --rm web bundle install --without production

initdb:
	docker-compose run --rm web bundle exec rails db:create
	docker-compose run --rm web bundle exec rails db:migrate

resetdb:
	docker-compose run --rm web bundle exec rails db:migrate:reset

bi:
	docker-compose run --rm web bundle install

migrate:
	docker-compose run --rm web bundle exec rails db:migrate

s:
	docker-compose run --rm web rails s -b 0.0.0.0

controller:
	docker-compose run --rm web bundle exec rails generate controller ${name}

console:
	docker-compose run --rm web rails console

yarn-install:
	docker-compose run --rm yarn install

yarn-dev: ## Entry for yarn command
	docker-compose run --rm yarn run dev

yarn-watch: ## Run yarn watch
	docker-compose run --rm yarn run watch
