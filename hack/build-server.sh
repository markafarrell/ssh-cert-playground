#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Building server image ===== 🚀\n"

    pushd ${SCRIPT_DIR}/.. >/dev/null

    docker build -t ssh-cert-playground/server -f server/Dockerfile .

    popd >/dev/null
}

main "$@"
