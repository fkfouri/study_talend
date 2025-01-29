FROM python:3.10.15-bullseye

RUN apt-get update && apt install -y wget

WORKDIR /workspaces

RUN wget https://downloads.mysql.com/docs/sakila-db.tar.gz && \
    tar -xvf sakila-db.tar.gz && \
    rm sakila-db.tar.gz 

RUN mv sakila-db/* . && \
    rm sakila-db -rf


# RUN for sql in *.sql; do mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS sakila;"; mysql -u root -p"${MYSQL_ROOT_PASSWORD}" sakila < $sql; done