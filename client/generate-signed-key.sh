#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Generating signed ssh key ===== 🚀\n"

    TARGET_USER=${1:-""}

    mkdir -p ~/.ssh

    ssh-keygen -t ed25519 -o -a 64 -N "" -C "ssh-ca" -f ~/.ssh/id_ed25519
    ssh-keygen -s /ca/id_ed25519 -I ${TARGET_USER} -n ${TARGET_USER} -V -1m:+2m "~/.ssh/id_ed25519.pub"

    ssh-keygen -Lf /root/.ssh/id_ed25519-cert.pub

}

main "$@"
