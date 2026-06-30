#!/usr/bin/env bash
set -eou pipefail

function main() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    printf "🚀 ===== Configurng openbao ===== 🚀\n"

    # https://openbao.org/docs/secrets/ssh/signed-ssh-certificates/

    if bao secrets list -format=json | jq -e '.["ssh-client-signer/"]'; then
        printf "ssh-client-signer secrets engine already enabled.\n"
    else
        bao secrets enable -path=ssh-client-signer ssh
        bao write ssh-client-signer/config/ca generate_signing_key=true
    fi

    bao write ssh-client-signer/roles/my-role -<<"EOH"
{
  "algorithm_signer": "rsa-sha2-256",
  "allow_user_certificates": true,
  "allowed_users": "*",
  "allowed_extensions": "permit-pty,permit-port-forwarding",
  "default_extensions": {
    "permit-pty": ""
  },
  "key_type": "ca",
  "default_user": "ubuntu",
  "ttl": "30m0s"
}
EOH
}

main "$@"
