#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
  export BASE_PATH="${PWD}"
}

@test "creates symlink (hidden) for dotfiles in tmp home directory" {
  run link_dotfiles
  assert_success
  assert [ -d "${TMP_DIR}/.bin" ]
  assert [ -d "${TMP_DIR}/.grc" ]
  assert [ -f "${TMP_DIR}/.bash_aliases" ]
  assert [ -f "${TMP_DIR}/.bash_functions" ]
  assert [ -f "${TMP_DIR}/.exports" ]
  assert [ -f "${TMP_DIR}/.gemrc" ]
  assert [ -f "${TMP_DIR}/.gitconfig" ]
  assert [ -f "${TMP_DIR}/.gitignore" ]
  assert [ -f "${TMP_DIR}/.inputrc" ]
  assert [ -f "${TMP_DIR}/.irbrc" ]
  assert [ -f "${TMP_DIR}/.profile" ]
  assert [ -f "${TMP_DIR}/.railsrc" ]
}
