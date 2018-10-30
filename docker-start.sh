#!/usr/bin/env bash

# # make sure everything is clean and well setup
./setup.sh
# # start blockchain and put in background
./eosio_docker/eosio.sh
# start mongodb and put in background
./eosio_docker/mongo.sh
