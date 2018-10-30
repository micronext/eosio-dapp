#!/usr/bin/env bash
set -o errexit;
if [ -e "data/initialized" ]; then 
    script="./scripts/continue_blockchain.sh"; 
else 
    script="./scripts/init_blockchain.sh"; 
fi

/bin/bash -c "$script"
