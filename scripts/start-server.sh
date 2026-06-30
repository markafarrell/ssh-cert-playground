#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Starting server ===== 🚀\n"

    docker network create ssh-cert-playground || true

    source ${SCRIPT_DIR}/../hack/build-server.sh

    docker run --rm -dt --hostname=server -v ${SCRIPT_DIR}/../ca:/ca --name ssh-cert-playground-server --network=ssh-cert-playground ssh-cert-playground/server
}

main "$@"
