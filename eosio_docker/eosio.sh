#!/usr/bin/env bash
set -o errexit

if [ -e "data/initialized" ]
then
    script="./scripts/continue_blockchain.sh"
else
    script="./scripts/init_blockchain.sh"
fi
echo "=== run docker container from the eosio/eos-dev image ==="
docker run --rm --name eosio_blog_container -d \
-p 8888:8888 -p 9876:9876 \
--mount type=bind,src="$(pwd)"/contracts,dst=/opt/eosio/bin/contracts \
--mount type=bind,src="$(pwd)"/scripts,dst=/opt/eosio/bin/scripts \
--mount type=bind,src="$(pwd)"/data,dst=/mnt/dev/data \
-w "/opt/eosio/bin/" \
eosio/eos-dev:v1.3.2 \
/bin/bash -c "$script"

echo "=== run docker container from the mongo image ==="
docker run --rm --name mongo_blog_container -d \
-p 27017:27017 \
--mount type=bind,src="$(pwd)"/mongodb,dst=/data/db \
mongo:4.0

echo "=== :::: RUNNED";
echo "=== :::: ";
echo "=== :::: eosio_blog_container";
echo "=== :::: mongo_blog_container";
