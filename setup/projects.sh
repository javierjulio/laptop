#!/bin/bash

PROJECTS_PREFIX="$HOME/Projects"

clone_repo() {
  local dir
  dir=$(basename "${2:-$1}")
  if [ ! -d "$PROJECTS_PREFIX/$dir" ]; then
    git clone "https://github.com/$1.git" "$PROJECTS_PREFIX/${dir}"
    echo "Cloned $1 successfully."
  fi
}

clone_repo "javierjulio/javierjulio.github.io" "javierjulio"
clone_repo "javierjulio/binlist-elixir"
clone_repo "javierjulio/binlist-node"
clone_repo "javierjulio/cheats"
clone_repo "javierjulio/chris-courses"
clone_repo "javierjulio/game-dev"
clone_repo "javierjulio/gdevelop-examples"
clone_repo "javierjulio/how-to-program-games"
clone_repo "javierjulio/humble-bundle-key-exporter"
clone_repo "javierjulio/manager-game-sources"
clone_repo "javierjulio/memory-game"
clone_repo "javierjulio/new-star-manager-data"
clone_repo "javierjulio/nonograms-game"
clone_repo "javierjulio/soccer-manager-game"
clone_repo "javierjulio/writebook"

clone_repo "activeadmin/activeadmin"
clone_repo "activeadmin/arbre"
clone_repo "activeadmin/demo.activeadmin.info" "activeadmin-demo"
clone_repo "activeadmin/inherited_resources"
