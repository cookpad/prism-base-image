FROM public.ecr.aws/docker/library/golang:1.16-stretch AS ecr-login

RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login

FROM public.ecr.aws/docker/library/openjdk:11-jdk-buster

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
