# django-template
Starter template for Django projects


# Installation guide

Clone the repository
```shell
git clone https://github.com/julleks/django-template/
```


Install [pyenv](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) and dependencies (macOS)
```shell
brew install openssl readline sqlite3 xz zlib

curl https://pyenv.run | bash

pyenv install 3.10.1
```


Install [poetry](https://python-poetry.org)
```shell
cd django-template

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

source $HOME/.poetry/env

poetry config settings.virtualenvs.in-project true
```


```shell
pyenv local 3.10.1

poetry install

peotry shell
```


Install pre-commit
```shell
pre-commit install
```


### Create the database

```shell
psql postgres

create database django_template;
create user username with encrypted password "password";
grant all privileges on database django_template to username;
\q

psql django_template
create extension postgis;
create extension postgis_topology;
\q
```


### Apply migrations

```shell
cd app
./manage.py migrate
```


### Create superuser

```shell
./manage.py createsuperuser
```


### Run the server

```shell
./manage.py runserver
```
