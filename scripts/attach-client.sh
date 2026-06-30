#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Attaching to client ===== 🚀\n"

    docker exec -it ssh-cert-playground-client bash
}

main "$@"
