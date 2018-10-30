#!/usr/bin/env bash
cd "$(dirname "$0")"
if [ -d "dapp.init" ]; then
    exit 1;
fi
docker pull eosio/eos-dev:v1.3.2
docker pull mongo:4.0
cd ./frontend && npm install && cd ../
cd ./backend && npm install && cd ../
echo " " > "dapp.init"
