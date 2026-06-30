#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Stopping openbao ===== 🚀\n"

    docker stop ssh-cert-playground-openbao
}

main "$@"
