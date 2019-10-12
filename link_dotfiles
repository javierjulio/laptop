#!/bin/sh

(
  cd dotfiles || exit

  for dotfile in *
  do
    ln -nsf "${PWD}/${dotfile}" "${HOME}/.${dotfile}"
  done
)
