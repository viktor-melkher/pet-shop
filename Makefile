# the first target is the one that executed by default
# when uesr call make with no target.
# let's do nothing in this case
.PHONY: nop
nop:
	@echo "Please pass a target you want to run"

# queue related targets
.PHONY: queue-flush
queue-flush:
	docker exec -it redis_main redis-cli flushall

.PHONY: horizon
horizon:
	docker exec -it redis_main redis-cli flushall
	docker exec -it -w /var/www/localhost webserver_main bash -c 'php artisan horizon'

.PHONY: main
main:
	./vendor/bin/sail shell

.PHONY: start
start:
	cd docker && docker-compose -p sjob-main up

.PHONY: sail-up
sail-up:
	./vendor/bin/sail up -d

.PHONY: sail-down
sail-down:
	./vendor/bin/sail down

.PHONY: sail-build
sail-build:
	./vendor/bin/sail build

.PHONY: alias
alias:
	alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
