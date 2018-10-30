#!/usr/bin/env bash
set -o errexit
if [ ! -d "./.eosinit" ]; then
    exit 1;
fi
. ./stop.sh

rm -rf "./eosio_docker/data"
mkdir -p "./eosio_docker/data"
echo " " > "./eosio_docker/data/.gitkeep"

rm -rf "./eosio_docker/mongodb"
mkdir -p "./eosio_docker/mongodb"
echo " " > "./eosio_docker/mongodb/.gitkeep"

rm -rf "./frontend/node_modules"
rm "./frontend/package-lock.json"
rm -rf "./backend/node_modules"
rm "./backend/package-lock.json"
