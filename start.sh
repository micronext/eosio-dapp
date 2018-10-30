#!/usr/bin/env bash
CURDIR="e:/Work/eosio-dapp"
./setup.sh # make sure everything is clean and well setup
set -o errexit
if [ -e "data/initialized" ]
then
    script="./scripts/continue_blockchain.sh"
else
    script="./scripts/init_blockchain.sh"
fi
docker run -d -p 8888:8888 -p 9876:9876 \
    --name eosio_blog_container \
    -w "/opt/eosio/bin/" \
    --mount type=bind,src="$CURDIR/eosio_docker/contracts",dst="/opt/eosio/bin/contracts" \
    --mount type=bind,src="$CURDIR/eosio_docker/scripts",dst="/opt/eosio/bin/scripts" \
    --mount type=bind,src="$CURDIR/eosio_docker/data",dst="/mnt/dev/data" \
    eosio/eos-dev:v1.3.2 \
    /bin/bash -c "$script"

docker run -d -p 27017:27017 \
    --name mongo_blog_container \
    --mount type=bind,src="$CURDIR/eosio_docker/mongodb",dst="/data/db" \
    mongo:4.0
