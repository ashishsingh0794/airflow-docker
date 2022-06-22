FROM apache/airflow:2.2.2

ENV AIRFLOW_HOME=/opt/airflow

USER root
RUN apt-get update \
    && pip install --upgrade pip \
    && apt-get install vim python3-dev gcc libxml2-dev libxslt1-dev zlib1g-dev g++ libsasl2-dev libldap2-dev libssl-dev -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

WORKDIR $AIRFLOW_HOME

USER airflow

RUN pip install --no-cache-dir -r requirements.txt

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-u", "-x", "-c"]

