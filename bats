#!/usr/bin/env bash

set -e

BATS_PREFIX="$HOME/.bats"

if [ -d "$BATS_PREFIX" ]; then
  echo -e "\nUpdating Bats..."
  cd "$BATS_PREFIX"
  git pull
else
  echo -e "\nInstalling Bats..."
  git clone https://github.com/sstephenson/bats.git "$BATS_PREFIX"
fi
