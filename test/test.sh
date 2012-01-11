#!/usr/bin/env bash

# to override PREFIX first run: export PREFIX=~/some-directory
# and then this script
if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi

echo "Installed ruby-build at ${PREFIX}"
