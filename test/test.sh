#!/bin/bash
set -o nounset
set -o errexit

if [[ -z $version ]]
then
    version=2.12.2
fi

docker run -i -v $PWD:/pack hank997/harbor-arm:${version} mv  /harbor-offline-installer-${version}.tgz /pack

tar xf harbor-offline-installer-${version}.tgz

cd harbor

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/C=CN/ST=Beijing/L=Shanghai/O=YourOrg/CN=harbor.local"

mv harbor.yml.tmpl harbor.yml
sed -i 's#reg.mydomain.com#test.hankbook.cn#g' harbor.yml
sed -i "s#certificate: .*#certificate: $PWD/cert.pem#g" harbor.yml
sed -i "s#private_key: .*#private_key: $PWD/key.pem#g" harbor.yml

docker load < harbor.${version}.tar.gz
./prepare
docker-compose up -d


# bash install.sh

for i in {1..10}
do
    sleep 5
    docker ps
done
