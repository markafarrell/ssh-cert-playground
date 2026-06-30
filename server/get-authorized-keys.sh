#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    TARGET_USER=${1}

    printf "===== Getting authorized keys for $TARGET_USER =====\n" 1>&2

    AUTHORIZED_KEY="cert-authority,principals=\"$TARGET_USER\" $(cat /ca/id_ed25519.pub)"
    echo ${AUTHORIZED_KEY}

    BAO_AUTHORIZED_KEY="cert-authority,principals=\"$TARGET_USER\" $(curl --silent -L http://openbao:8200/v1/ssh-client-signer/public_key)"
    echo ${BAO_AUTHORIZED_KEY}

    printf "===== Got authorized keys for $TARGET_USER =====\n" 1>&2
    printf "===== ${AUTHORIZED_KEY} =====\n" 1>&2
    printf "===== ${BAO_AUTHORIZED_KEY} =====\n" 1>&2
}

main "$@"
