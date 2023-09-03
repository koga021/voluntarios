
configure:
	python3 -m venv virtual && source virtual/bin/activate && pip install -r requirements.txt

build-app:
	#@docker build -t website-local .
	docker  buildx build -t website-local -f Dockerfile .

build-service:
	#@docker build -t website-local .
	docker  buildx build -t postgres-local -f DockerfilePostgres .

run:
	@docker run -it  website-local     

up: 
	docker-compose up -d 
down:
	docker-compose down

# run:
# 	source virtual/bin/activate && virtual/bin/python 