#!/bin/bash

if [[ -z $version ]]
then
    version=2.12.2
fi

echo version: $version

git clone --branch v${version} https://github.com/goharbor/harbor.git

cd harbor


sed -i "s#VERSIONTAG=dev#VERSIONTAG=${version}#g" ./Makefile 
sed -i "s#BASEIMAGETAG=dev#BASEIMAGETAG=${version}#g" ./Makefile 
sed -i "s#PULL_BASE_FROM_DOCKERHUB=true#PULL_BASE_FROM_DOCKERHUB=false#g" ./Makefile 
sed -i "s#BUILDBIN=false#BUILDBIN=true#g" ./Makefile 
sed -i 's#--no-cache##g' make/photon/Makefile 
sed -i 's#GOARCH=amd64#GOARCH=arm64#g' make/photon/exporter/Dockerfile 
#sed -i '9aENV GOPROXY="https://goproxy.io"' make/photon/exporter/Dockerfile 
#sed -i '2aENV GOPROXY="https://goproxy.io"' make/photon/registry/Dockerfile.binary 
#sed -i '2aENV GOPROXY="https://goproxy.io"' tools/swagger/Dockerfile 
sed -i 's#swagger_linux_amd64#swagger_linux_arm64#g' tools/swagger/Dockerfile

make package_offline

ls
