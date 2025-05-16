FROM alpine
ARG version=2.5.6
COPY harbor/harbor-offline-installer-${version}.tgz /harbor-offline-installer-${version}.tgz
