#!/usr/bin/env bash

echo "==== Start of First Time Setup ===="

# Change to Script's Dir
cd "$(dirname "$0")"

# Make sure Docker and Node.js are installed
if [ ! -x "$(command -v docker)" ] ||
   [ ! -x "$(command -v npm)" ]; then
    echo ""
    echo -e "\033[0;31m[Error with Exception]\033[0m"
    echo "Please make sure Docker and Node.js are Installed"
    echo ""
    echo "Install Docker: https://docs.docker.com/docker-for-mac/install/"
    echo "Install Node.js: https://nodejs.org/en/"
    echo ""
    exit
fi

# Download eosio/eos-dev:v1.4.2 Docker Image
# echo "=== Pull eosio/eos-dev Image v1.4.4 from Docker Hub ==="
# docker pull eosio/eos-dev:v1.4.4

# Force Remove the Container if it Exists
# Create a Clean Data Dolder in eosio_docker to preserve the Block Data
echo "=== Setup/Reset Data for eosio_docker ==="
docker stop eosio_king_dollar_container || true && docker rm --force eosio_king_dollar_container || true
sudo rm -rf "./eosio_docker/data"
mkdir -p "./eosio_docker/data"

# # Setup node_modules for Frontend
# echo "=== NPM Install Packpage for Frontend React App ==="
# # Change Dir to ./frontend
# cd "./frontend"
# npm install
