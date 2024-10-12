FROM apache/airflow:2.10.2

ARG DOCKER_GID
ARG USER_NAME
ARG USER_ID

USER root

# TODO: reduce run layers
RUN groupadd -g ${USER_ID} ${USER_NAME}
RUN useradd -m -u ${USER_ID} -g ${USER_ID} -s /bin/bash ${USER_NAME}
RUN groupadd -g ${DOCKER_GID} docker
RUN usermod -aG docker ${USER_NAME}

USER ${USER_NAME}

RUN pip install apache-airflow-providers-docker
