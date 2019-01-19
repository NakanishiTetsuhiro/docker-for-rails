build:
	docker-compose exec web rails new . -d postgresql --skip-bundle
	# docker-compose exec web bundle install --path vendor/bundle
	# --without productionオプションを追加すると，本番用のgemはローカル環境にインストールはされない．
	# docker-compose exec web bundle install --without production
	docker-compose exec web bundle install
	docker-compose exec web bundle exec rails db:create

bi:
	docker-compose exec web bundle install

migrate:
	docker-compose exec web bundle exec rails db:migrate

s:
	docker-compose exec web rails s -b 0.0.0.0

controller:
	docker-compose exec web bundle exec rails generate controller ${name}
