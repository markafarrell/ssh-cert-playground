#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Starting client ===== 🚀\n"

    docker network create ssh-cert-playground || true

    source ${SCRIPT_DIR}/../hack/build-client.sh

    docker run --rm -dt \
        --hostname=client \
        -v ${SCRIPT_DIR}/../ca:/ca \
        -e BAO_ADDR="http://openbao:8200" \
        -e BAO_TOKEN="openbao" \
        --network ssh-cert-playground \
        --name ssh-cert-playground-client \
        ssh-cert-playground/client
}

main "$@"
