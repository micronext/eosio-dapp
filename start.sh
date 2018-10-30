#!/usr/bin/env bash
CURDIR="e:/Work/eosio-dapp"
./setup.sh # make sure everything is clean and well setup
#
set -o errexit;
if [ -e "data/initialized" ]; then script="./scripts/continue_blockchain.sh"; else script="./scripts/init_blockchain.sh"; fi

docker run -d -p 8888:8888 -p 9876:9876 \
    --name eosio_blog_container \
    -w "/opt/eosio/bin/" \ # workdir
    -v $CURDIR/eosio_docker/contracts:/opt/eosio/bin/contracts \
    -v $CURDIR/eosio_docker/scripts:/opt/eosio/bin/scripts \
    -v $CURDIR/eosio_docker/data:/mnt/dev/data \
    eosio/eos-devsss \
    /bin/bash -c "$script"

docker volume create eos-mongo

docker run -d -p 27017:27017 \
    --name mongo_blog_container \
    -v eos-mongo:/data/db \
    mongo:4.0
