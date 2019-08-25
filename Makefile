setup:
	cp -n .env.dist .env
	cp -n docker-compose.local.yml.dist docker-compose.local.yml

deploy:
	docker-compose run --rm deploy