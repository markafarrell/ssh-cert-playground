#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Tailing server logs ===== 🚀\n"

    docker logs -f ssh-cert-playground-server
}

main "$@"
