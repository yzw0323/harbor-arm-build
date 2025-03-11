#!/bin/bash

version=2.12.2

git clone --branch v${version} https://github.com/goharbor/harbor.git

cd harbor

make package_offline


