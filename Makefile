
configure:
	python3 -m venv virtual && source virtual/bin/activate && pip install -r requirements.txt
build:
	docker build -t website-local .
run:
	docker run -it  website-local     

# run:
# 	source virtual/bin/activate && virtual/bin/python 