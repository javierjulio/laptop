#!/bin/bash

set -e
set -o pipefail

(
# find all executables and run `shellcheck`
for f in $(find . -type f -not -iwholename '*.git*' | sort -u); do
	if file "$f" | grep --quiet shell; then
		shellcheck -x "$f" && echo "[OK]: sucessfully linted $f" || exit 1
	fi
done
)
