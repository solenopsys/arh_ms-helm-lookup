#!/bin/sh

build_push(){
  docker buildx build  --platform ${ARCHS} -t ${REGISTRY}/${NAME}:latest  --output=type=registry,registry.insecure=true --push .
}

helm_build_push(){
  FN=${NAME}-${VER}.tgz
  helm package ./install --version ${VER}
  curl --data-binary "@${FN}" http://helm.klogsolenopsys.org/api/charts
  rm ${FN}
}

REGISTRY=registry.klogsolenopsys.org
NAME=alexstorm-helm-lookup
ARCHS="linux/amd64,linux/arm64"
VER=0.1.19


#helm_build_push
build_push





