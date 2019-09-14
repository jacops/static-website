setup:
	cp -n .env.dist .env
	cp -n docker-compose.local.yml.dist docker-compose.local.yml

build:
	docker-compose run --rm build

deploy:
	docker-compose run --rm deploy