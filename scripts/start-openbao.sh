
#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Starting openbao ===== 🚀\n"

    docker network create ssh-cert-playground || true

    docker run --rm -dt --hostname=openbao \
        --name ssh-cert-playground-openbao \
        --network=ssh-cert-playground \
        --env BAO_DEV_ROOT_TOKEN_ID="openbao" \
        openbao/openbao:2.5.5
}

main "$@"



