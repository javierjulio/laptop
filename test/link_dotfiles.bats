#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
  export BASE_PATH="${PWD}"
}

@test "creates symlink (hidden) for dotfiles in tmp home directory" {
  run link_dotfiles
  assert_success
  assert [ -d "${TMP_DIR}/.grc" ]
  assert [ -f "${TMP_DIR}/.grc/conf.todos" ]
  assert [ -d "${TMP_DIR}/.profile.d" ]
  assert [ -f "${TMP_DIR}/.profile.d/development" ]
  assert [ -f "${TMP_DIR}/.profile.d/git" ]
  assert [ -f "${TMP_DIR}/.profile.d/google" ]
  assert [ -f "${TMP_DIR}/.profile.d/heroku" ]
  assert [ -f "${TMP_DIR}/.profile.d/history" ]
  assert [ -f "${TMP_DIR}/.profile.d/node" ]
  assert [ -f "${TMP_DIR}/.profile.d/path" ]
  assert [ -f "${TMP_DIR}/.profile.d/prompt" ]
  assert [ -f "${TMP_DIR}/.profile.d/ruby" ]
  assert [ -f "${TMP_DIR}/.profile.d/system" ]
  assert [ -f "${TMP_DIR}/.gemrc" ]
  assert [ -f "${TMP_DIR}/.gitconfig" ]
  assert [ -f "${TMP_DIR}/.gitignore" ]
  assert [ -f "${TMP_DIR}/.inputrc" ]
  assert [ -f "${TMP_DIR}/.irbrc" ]
  assert [ -f "${TMP_DIR}/.profile" ]
  assert [ -f "${TMP_DIR}/.railsrc" ]
  assert [ -f "${TMP_DIR}/.zshrc" ]
}

@test "makes the BUNDLE_EDITOR variable available" {
  run echo $BUNDLER_EDITOR
  assert_success
  assert_output "code"
}
