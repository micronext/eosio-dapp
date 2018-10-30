#!/usr/bin/env bash
cd "$(dirname "$0")"
if [ ! -d "./dapp.init" ]; then
    exit 1;
fi

docker pull eosio/eos:latest \
    && docker pull eosio/eos-dev:latest \
    && docker pull mongo:4 \
    && docker pull node:8
    
echo " " > ./dapp.init

# cd ./frontend && npm install && cd ../
# cd ./backend && npm install && cd ../