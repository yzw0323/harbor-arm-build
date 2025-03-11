#!/bin/bash

if [[ -z $version ]]
then
    version=2.12.2
fi

docker run -it -v $PWD:/pack hank997/harbor-arm::${version} mv  /harbor-offline-installer-${version}.tgz /pack

tar xf harbor-offline-installer-${version}.tgz

mv harbor/harbor.yml.tmpl harbor/harbor.yml
sed -i 's#reg.mydomain.com#test.hankbook.cn#g' harbor/harbor.yml

cd harbor/ ; bash install.sh

for i in {1..10}
do
    sleep 5
    docker ps
done
