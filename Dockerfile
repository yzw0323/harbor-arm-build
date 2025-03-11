FROM alpine
ARG version=2.12.2
COPY harbor/harbor-offline-installer-${version}.tgz /harbor-offline-installer-${version}.tgz