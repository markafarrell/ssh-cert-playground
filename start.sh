#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    source ${SCRIPT_DIR}/scripts/generate-ca.sh
    source ${SCRIPT_DIR}/scripts/start-server.sh
    source ${SCRIPT_DIR}/scripts/start-client.sh
}

main "$@"
