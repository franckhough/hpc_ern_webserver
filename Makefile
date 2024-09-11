.PHONY: clean run build 

clean: 
	@docker system prune --force

build: 
	@docker compose build --no-cache ern_webserver

run:
	@docker compose run --rm --interactive ern_webserver 

container:
	@docker compose create ern_webserver

list_images:
	@docker image ls -a

list_containers:
	@docker ps -a
