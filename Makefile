postgres-pull:
	docker pull stackbrew/postgres
postgres-run:
	docker run -d --name cobudget-postgres stackbrew/postgres
postgres-start:
	docker start cobudget-postgres
postgres-stop:
	docker stop cobudget-postgres
postgres-rm:
	docker rm cobudget-postgres
postgres-logs:
	docker logs cobudget-postgres
