FROM apache/airflow:latest

LABEL maintainer "Ashish Singh <ashishsingh0794@gmail.com>"

ENV AIRFLOW_HOME=/opt/airflow
ARG AIRFLOW_USER=airflow

USER root

RUN mkdir -p $AIRFLOW_HOME && apt-get install -y --fix-broken && apt-get autoremove &&\
    apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install vim python3-dev -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $AIRFLOW_HOME

COPY requirements.txt entrypoint.sh ./

RUN chown -R $AIRFLOW_USER $AIRFLOW_HOME
RUN chmod a+rx entrypoint.sh

USER $AIRFLOW_USER

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/usr/bin/dumb-init", "--", "./entrypoint.sh"]

