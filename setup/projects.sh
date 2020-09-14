#!/bin/sh

PROJECTS_PREFIX="$HOME/Projects"

clone_repo() {
  if [ ! -d "$PROJECTS_PREFIX/${2:-$1}" ]; then
    git clone "https://github.com/javierjulio/$1.git" "$PROJECTS_PREFIX/${2:-$1}"
    echo "Cloned $1 successfully."
  fi
}

clone_repo "javierjulio.github.io" "javierjulio"
clone_repo "activeadmin"
clone_repo "binlist-elixir"
clone_repo "dwolla-v2-ruby"
clone_repo "humble-bundle-key-exporter"
clone_repo "inherited_resources"
clone_repo "jsoneditor-rails"
clone_repo "paysafe"
