#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    TARGET_USER=${1}

    printf "===== Getting authorized keys for $TARGET_USER =====\n" 1>&2

    AUTHORIZED_KEY="cert-authority $(cat /ca/id_ed25519.pub)"
    echo ${AUTHORIZED_KEY}

    printf "===== Got authorized keys for $TARGET_USER: $AUTHORIZED_KEY =====\n" 1>&2
}

main "$@"
