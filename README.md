# Overview
Escrow Smart Contract

# Setup
Make sure Docker and Node.js are installed

Install Docker: https://docs.docker.com/docker-for-mac/install/
Install Node.js: https://nodejs.org/en/

Install Application Packages in the current workspace using:
```
npm install
```

Run the following Bash Script to Setup the Environnent!
```
./quickstart.sh
```
OR using NodeJS
```
node server.js
```

To Log the Blockchain Node to Console
```
docker logs eosio_king_dollar_container --follow
```

To Execute Commands within the King-Dollar Docker EOS Environment
```
docker exec -it eosio_king_dollar_container bash
```

Create & Run the following Bash Script to Interface with `cleos` and `eosio-cpp/eosio-abigen` for Local Containerised Testnet
```
#!/bin/bash

alias cleos='docker exec eosio_king_dollar_container /opt/eosio/bin/cleos -u http://127.0.0.1:8888'
alias cleos-cpp='docker exec eosio_king_dollar_container eosio-cpp'
alias eosio-abigen='docker exec eosio_king_dollar_container eosio-abigen'
```
