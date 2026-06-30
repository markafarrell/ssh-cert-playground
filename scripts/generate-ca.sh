#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Generating SSH CA ===== 🚀\n"

    pushd ${SCRIPT_DIR}/../ca >/dev/null

    ssh-keygen -t ed25519 -o -a 64 -N "" -C "ssh-ca" -f id_ed25519

    popd >/dev/null
}

main "$@"


