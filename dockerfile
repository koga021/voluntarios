FROM alpine:3.14
RUN apk update && apk add --update --no-cache curl python3 python3-dev postgresql py3-pip build-base libffi-dev py3-wheel gdal cmake git && ln -sf python3 /usr/bin/python
RUN apk add postgresql-dev=9.6.10-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.5/main
#Instalando o Rust
RUN python3 -m pip install --upgrade pip
RUN  curl https://sh.rustup.rs -sSf | sh -s -- -y
WORKDIR /opt/app

#RUN echo 'echo "welcome to the container"' > /etc/profile.d/welcome.sh && echo "Imagem gerada em: \n" date >> /etc/profile.d/welcome.sh
#ENTRYPOINT ["/bin/sh", "-l", "-c"]
RUN echo "Essa imagem foi gerada em: " $(date) >> ./img_status.txt
RUN cat img_status.txt
#RUN ["cat", "img_status.txt"]
#CMD ["cat","img_status.txt"]

COPY . .
RUN pip3 install -r requirements.txt