init:
	docker-compose exec web rails new . -d postgresql --skip-bundle --skip-coffee --skip-turbolinks --skip-sprockets
	docker-compose exec web bundle install --without production

initdb:
	docker-compose exec web bundle exec rails db:create
	docker-compose exec web bundle exec rails db:migrate

resetdb:
	docker-compose exec web bundle exec rails db:migrate:reset

bi:
	docker-compose exec web bundle install

migrate:
	docker-compose exec web bundle exec rails db:migrate

s:
	docker-compose exec web rails s -b 0.0.0.0

controller:
	docker-compose exec web bundle exec rails generate controller ${name}

console:
	docker-compose exec web rails console


yarn-install:
	docker-compose run --rm yarn install

yarn-dev: ## Entry for yarn command
	docker-compose run --rm yarn run dev

yarn-watch: ## Run yarn watch
	docker-compose run --rm yarn run watch
