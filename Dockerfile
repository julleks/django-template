FROM python:3.10-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git binutils libproj-dev gdal-bin libcurl4-openssl-dev libssl-dev python3-dev python-dev libffi-dev build-essential\
    && apt-get clean

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

ARG SSH_PRIVATE_KEY
RUN echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa

RUN pip install poetry==1.1.12

COPY poetry.lock pyproject.toml /app/
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

COPY ./ /app

EXPOSE 80

ARG BUILD_ID_ARG
ENV BUILD_ID=$BUILD_ID_ARG
ARG SETTINGS
ENV DJANGO_SETTINGS_MODULE=$SETTINGS
ARG REPOSITORY_NAME
ENV REPOSITORY_NAME=$REPOSITORY_NAME

CMD ["/app/deployment/launch_instance.sh"]
