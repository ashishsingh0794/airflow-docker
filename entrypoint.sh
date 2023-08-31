#!/usr/bin/env bash

airflow db migrate
airflow connections create-default-connections

exec /entrypoint "${@}"