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
clone_repo "binlist-node"
clone_repo "how-to-program-games"
clone_repo "humble-bundle-key-exporter"
clone_repo "inherited_resources"
clone_repo "memory-game"
clone_repo "new-star-manager-data"
clone_repo "nonograms-game"
