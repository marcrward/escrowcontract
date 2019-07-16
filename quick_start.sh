#!/usr/bin/env bash

# Clean and Setup Working Dir
echo "[quick_start.sh] First Time Setup"
./first_time_setup.sh

# Start the Blockchain and Run it as a Process in the Background
echo "[quick_start.sh] Starting Eosio Docker"
./start_eosio_docker.sh --nolog

# Wait until the Single-Producer Node has Started
until $(curl --output /dev/null \
            --silent \
            --head \
            --fail \
            localhost:8888/v1/chain/get_info)

do
    echo "Waiting Eosio Blockchain to be Started..."
    sleep 2s
done

# # Start the Frontend React App
# echo "[quick_start.sh] Starting Frontend React App"
# ./start_frontend.sh & 
# P1=$! # PID of the most recent Background Command

# Wait $P1
# wait $P1