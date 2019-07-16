#!/usr/bin/env bash

# Change to Script's Dir
cd "$(dirname "$0")/eosio_docker"

if [ -e "data/initialized" ]
then
    echo "Continue Blockchain State"
    script="./scripts/continue_blockchain.sh"
else
    echo "Init New Blockchain State"
    script="./scripts/init_blockchain.sh"
fi

echo "=== Run Docker Container from the eosio/eos-dev Image ==="
docker run --rm --name eosio_king_dollar_container -d \
-p 8888:8888 -p 9876:9876 \
--mount type=bind,src="$(pwd)"/contracts,dst=/opt/eosio/bin/contracts \
--mount type=bind,src="$(pwd)"/scripts,dst=/opt/eosio/bin/scripts \
--mount type=bind,src="$(pwd)"/data,dst=/mnt/dev/data \
-w "/opt/eosio/bin/" eosio-container:eos1.6.0-cdt1.5.0 /bin/bash -c "$script"

if [ "$1" != "--nolog" ]
then
    echo "=== Follow eosio_king_dollar_container Logs ==="
    docker logs eosio_king_dollar_container --follow
fi