FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Sao_Paulo 
RUN apt-get update && apt-get install python3.10 python3-pip postgresql postgis cmake git python3-psycopg2 systemctl -y
RUN python3 -m pip install --upgrade pip
COPY . .
RUN pip3 install -r requirements.txt
RUN systemctl start postgresql.service
RUN service postgresql restart
RUN su - postgres 
#RUN createdb ribas 
#CMD service postgresql restart