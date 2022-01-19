# prism-base-image

Docker base image definition for cookpad/prism: https://github.com/cookpad/prism .
This Docker image includes JVM and a part of Hadoop library binary.

## Build
```
% BASE_REPOS=YOUR_DOCKER_REPOSITORY ./build.sh
```
This command builds a docker image with tags "${BASE_REPOS}:${HADOOP_VERSION}-${OS_VERSION}"
and "${BASE_REPOS}:${GIT_REVISION}".  For example, when you give BASE_REPOS="youraccount/prism-base",
it builds:

- youraccount/prism-base:3.0.3-bullseye
- youraccount/prism-base:576fcb09e1667ecfe4eecf586d072b304acdc4e5

## License

MIT License, except Hadoop binary files.
Hadoop-derived files are licensed under original condition (Apache License 2.0).
