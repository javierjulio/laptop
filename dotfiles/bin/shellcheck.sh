#!/bin/bash

set -e
set -o pipefail

# find all executables recursively and run `shellcheck`

(
  status=0
  for f in $(find . -type f ! -path '.*/node_modules/*' ! -path './tmp/*' ! -path './.git/*' ! -path './vendor/*' ! -path './log/*' -perm +111 -print | sort -u); do
    if file "$f" | grep --quiet zsh; then
      # ShellCheck doesn't support zsh, so only check syntax.
      zsh -n "$f" && echo "[OK]: successfully syntax checked $f" || status=1
    elif file "$f" | grep --quiet shell; then
      shellcheck -x "$f" && echo "[OK]: successfully linted $f" || status=1
    fi
  done
  exit "$status"
)
