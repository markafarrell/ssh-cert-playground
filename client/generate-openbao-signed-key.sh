#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Generating signed ssh key ===== 🚀\n"

    TARGET_USER=${1:-""}

    mkdir -p ~/.ssh

    ssh-keygen -t ed25519 -o -a 64 -N "" -C "ssh-ca" -f ~/.ssh/id_ed25519
    bao write -field=signed_key ssh-client-signer/sign/my-role \
        public_key=@$HOME/.ssh/id_ed25519.pub valid_principals=${TARGET_USER} > $HOME/.ssh/id_ed25519-cert.pub

    ssh-keygen -Lf $HOME/.ssh/id_ed25519-cert.pub
}

main "$@"
