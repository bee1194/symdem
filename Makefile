up:
	docker-compose up -d --remove-orphans && docker ps
stop:
	docker-compose stop
rebuild:
	docker-compose down && docker-compose up -d --build && docker ps
shell-php-root:
	docker exec -it symdem_app bash -c 'cd /var/www/html; bash'
shell-php:
	docker exec -it --user www-data symdem_app bash -c 'cd /var/www/html; bash'
xdebug-off:
	docker exec -it symdem_app bash -c 'xoff'
xdebug-on:
	docker exec -it symdem_app bash -c 'xon'
ip:
	docker inspect -f '{{range.NetworkSettings.Networks}}<IPAddress:{{.IPAddress}}>{{end}}' symdem_app
composer-install:
	docker run --rm --interactive --tty --volume $$PWD:/app composer install
composer-update:
	docker run --rm --interactive --tty --volume $$PWD:/app composer update
npm-install-admin:
	cd ./ && npm install
npm-run-dev-admin:
	cd ./ && npm run dev
npm-run-watch-admin:
	cd ./ && npm run watch
pint:
	docker exec -it symdem_app bash -c './vendor/bin/pint'
pint-test:
	docker exec -it symdem_app bash -c './vendor/bin/pint --test'
