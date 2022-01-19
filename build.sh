#!/bin/bash -eux

VERSION=3.0.3
OS=bullseye

VERSION_TAG="${VERSION}-${OS}"
REVISION_TAG="$(git rev-parse HEAD)"

docker build --build-arg "HADOOP_VERSION=$VERSION" --tag "$VERSION_TAG" --tag "$REVISION_TAG" --cache-from "$VERSION_TAG" .

docker push "$BASE_REPOS:$VERSION_TAG"
docker push "$BASE_REPOS:$REVISION_TAG"
