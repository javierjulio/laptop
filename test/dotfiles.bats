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
  source "dotfiles/profile.d/development.sh"
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
