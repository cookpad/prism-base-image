#!/bin/bash -eux

HADOOP_VERSION=3.0.3
OS_VERSION=bullseye

VERSION_TAG="$BASE_REPOS:${HADOOP_VERSION}-${OS_VERSION}"
REVISION_TAG="$BASE_REPOS:$(git rev-parse HEAD)"

docker build --build-arg "HADOOP_VERSION=$HADOOP_VERSION" --tag "$VERSION_TAG" --tag "$REVISION_TAG" --cache-from "$VERSION_TAG" .

docker push "$VERSION_TAG"
docker push "$REVISION_TAG"
