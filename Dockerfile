FROM golang:1.12-stretch AS ecr-login

RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login

FROM openjdk:11-jdk-stretch

WORKDIR /app

RUN apt-get update && \
    apt-get install -y -qqq libsnappy1v5

ARG HADOOP_VERSION
ENV HADOOP_VERSION=${HADOOP_VERSION}
COPY hadoop-${HADOOP_VERSION}-libs.tar.gz .
RUN tar zxf hadoop-${HADOOP_VERSION}-libs.tar.gz && \
    cp lib*.so /usr/lib/ && \
    rm -f hadoop-${HADOOP_VERSION}-libs.tar.gz lib*.so

COPY --from=ecr-login /go/bin/docker-credential-ecr-login /usr/local/bin/
