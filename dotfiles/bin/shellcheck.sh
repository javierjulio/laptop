#!/bin/bash

set -e
set -o pipefail

# find all executables recursively and run `shellcheck`

(
  status=0
  for f in $(find . -type f -not -iwholename '*.git*' | sort -u); do
    if file "$f" | grep --quiet shell; then
      shellcheck -x "$f" && echo "[OK]: sucessfully linted $f" || status=1
    fi
  done
  exit "$status"
)
