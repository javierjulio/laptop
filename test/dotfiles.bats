#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "the BUNDLER_EDITOR variable is set" {
  source "dotfiles/profile.d/ruby.sh"
  run echo $BUNDLER_EDITOR
  assert_success
  assert_output "code"
}

@test "the EDITOR variable is set" {
  source "dotfiles/profile.d/paths.sh"
  run echo $EDITOR
  assert_success
  assert_output "code --wait"
}

@test "the PATH variable contains dotfiles/.bin path" {
  source "dotfiles/profile.d/paths.sh"
  run echo "$PATH"
  assert_success
  assert_output_match "${TMP_DIR}\/\.bin:"
}

@test "the files in dotfiles root are symlinked" {
  for file in $(find dotfiles -type f -maxdepth 1 -exec basename {} \;)
  do
    assert [ -f "${TMP_DIR}/.${file}" ]
  done
}

@test "the dotfiles/bin directory is symlinked with files" {
  assert [ -d "${TMP_DIR}/.bin" ]

  for file in $(basename dotfiles/bin/*)
  do
    assert [ -f "${TMP_DIR}/.bin/${file}" ]
  done
}

@test "the dotfiles/grc directory is symlinked with files" {
  assert [ -d "${TMP_DIR}/.grc" ]
  assert [ -f "${TMP_DIR}/.grc/conf.todos" ]
}

@test "the dotfiles/profile.d directory is symlinked with files" {
  assert [ -d "${TMP_DIR}/.profile.d" ]

  for file in $(basename dotfiles/profile.d/*)
  do
    assert [ -f "${TMP_DIR}/.profile.d/${file}" ]
  done
}
