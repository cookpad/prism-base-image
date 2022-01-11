#!/bin/bash -eux

REPO=789035092620.dkr.ecr.ap-northeast-1.amazonaws.com/prism-base
VERSION=3.0.3

# For cache
#docker pull "${REPO}:latest-${VERSION}" || true

docker build --build-arg "HADOOP_VERSION=${VERSION}" --tag "${REPO}:latest-${VERSION}" --tag "${REPO}:$(cat REVISION)-${VERSION}" --cache-from "${REPO}:latest-${VERSION}" .

docker push "$REPO:$(cat REVISION)-$VERSION"
docker push "$REPO:latest-$VERSION"
