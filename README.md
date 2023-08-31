## Airflow setup with Docker

This repository provides codes-set and helper guide for users who are looking to setup Docker based Airflow instance.

#### Steps of Setup
1. To use your instance folder to host Dags, plugins, supported scripts and capture logs - create these folders locally (as in folder "airflow"), tweak docker-compose file in volumes section and run **sudo chown 50000:0 dags logs plugins scripts**. '50000' is set airflow user id and '0' is respective group id in docker environment.
2. It is recommended to build your custom image first and then use that image to build airflow's core components container instances in Docker. This is to simply avoid the creation of separate docker images against each service of docker-compose file. You can simply use this Dockerfile build command as it is - **docker build . -t custom-verbose-airflow:1.0.0**.
3. Once the containers are up and running, you can access web server UI here - **http://localhost:8080/airflow** You can customize the URL by tweaking in '.env' file also.


__Note__:
1. User can look into the docker-compose file and use commented out lines as per the need. Please check on Airflow or Docker official page to understand the commented out configurations.
2. Git sync is also supported and provided in the docker-compose (commented out currently). User can configure this to make a Dags sync setup between git repo and instance.
3. To run any custom bash command during the container setup, user can use 'entrypoint.sh' file.
4. If user is intended to use docker based postgres database to store airflow metadata, then it is recommended to store postgres datafile locally (as /data/pg-sql here). Tweak in docker-compose file's volumes section of postgres service for the change.

Please reach out to ashishsingh0794@gmail.com in case of any question or query. Would be happy to help! 
Also, please give a star if this helps you!
