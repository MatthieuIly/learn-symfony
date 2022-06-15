docker_compose_up:
	docker compose up --build

list:
	@grep '^[^#[:space:]].*:' Makefile
