FROM python:3.10-slim

WORKDIR /app

COPY app/ /app/

RUN apt-get update && \
    apt-get install -y git apt-utils binutils libpq-dev libproj-dev gdal-bin libcurl4-openssl-dev libssl-dev python3-dev python-dev libffi-dev build-essential && \
    apt-get clean

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

ARG SSH_PRIVATE_KEY
RUN echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa

RUN /usr/local/bin/python -m pip install --upgrade pip &&\
    pip install poetry==1.1.12

COPY poetry.lock pyproject.toml /app/
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi

EXPOSE 80

CMD gunicorn core.wsgi:application --pythonpath=/app/ --workers=2 --bind 0.0.0.0:80
