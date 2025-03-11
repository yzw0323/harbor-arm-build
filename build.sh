#!/bin/bash

version=2.12.2

apt-get update
apt-get install git -y

git clone --branch v${version} https://github.com/goharbor/harbor.git


