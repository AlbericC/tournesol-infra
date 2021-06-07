#!/usr/bin/env bash

set -Eeuxo pipefail

CURRENT_DIR="$(dirname "$0")"

cd "$CURRENT_DIR/.."

if [[ "${1:-""}" == "apply" ]]
then
  CHECK=""
else
  CHECK="--check"
fi

ansible-playbook -i inventory.yml -l tournesol-vm setup.yml \
  $CHECK \
  -e "django_database_password=$DJANGO_DATABASE_PASSWORD" \
  -e "django_secret_key=$DJANGO_SECRET_KEY" \
