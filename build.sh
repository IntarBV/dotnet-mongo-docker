#!/bin/sh
# Load environment. This method works in bash, dash and zsh.

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
  cat << EOF
USAGE: ${0} [-p]

ARGUMENTS:
  -p            push to dockerhub after build
  -h, --help    print this help

EOF
exit 1
fi

eval "$(env echo -e $(cat .env))"
# Build images
docker build -t "${DOCKERHUB_USERNAME}/dotnet-mongo:${TAG:-latest}" --target="dotnet-mongo" .
docker build -t "${DOCKERHUB_USERNAME}/dotnet-mongo:httpbin-${TAG:-latest}" --target="with_httpbin" .

if [ "$1" = "-p" ]
then
  docker push "${DOCKERHUB_USERNAME}/dotnet-mongo:${TAG:-latest}"
  docker push "${DOCKERHUB_USERNAME}/dotnet-mongo:httpbin-${TAG:-latest}"
fi
