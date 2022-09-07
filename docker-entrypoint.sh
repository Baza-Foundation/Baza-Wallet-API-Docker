#!/bin/bash
set -e

docker_verify_minimum_env() {
    if [ -z "$WALLET_API_RPC_PASSWORD" ]; then
		cat >&2 <<-'EOE'
			Error: You must provide WALLET_API_RPC_PASSWORD env variable to initialize this container
		EOE
		exit 1
	fi
}

docker_verify_minimum_env

mkdir -p /data
chmod 700 /data

# Change file ownership to baza if running as root
# and drop privilege to baza
if [ "$1" = 'wallet-api' -a "$(id -u)" = '0' ]; then
	find /data \! -user baza -exec chown baza '{}' +
	exec gosu baza "$@"
fi

exec "$@"
