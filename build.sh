#!/bin/bash -eux

VERSION=3.0.3
OS=buster

# For cache
#docker pull "$REPO:$VERSION-$OS" || true

docker build --build-arg "HADOOP_VERSION=$VERSION" --tag "$REPO:$VERSION-$OS" --tag "$REPO:$(cat REVISION)" --cache-from "$REPO:$VERSION-$OS" .

docker push "$REPO:$(cat REVISION)"
docker push "$REPO:$VERSION-$OS"
