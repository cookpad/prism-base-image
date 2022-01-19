FROM public.ecr.aws/docker/library/openjdk:11-jre-slim-bullseye

WORKDIR /app

RUN apt-get update && \
    apt-get install -y -qqq libsnappy1v5

ARG HADOOP_VERSION
ENV HADOOP_VERSION=${HADOOP_VERSION}
COPY hadoop-${HADOOP_VERSION}-libs.tar.gz .
RUN tar zxf hadoop-${HADOOP_VERSION}-libs.tar.gz && \
    cp lib*.so /usr/lib/ && \
    rm -f hadoop-${HADOOP_VERSION}-libs.tar.gz lib*.so
