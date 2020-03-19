#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "the BUNDLER_EDITOR variable is set" {
  source "dotfiles/profile.d/ruby"
  run echo $BUNDLER_EDITOR
  assert_success
  assert_output "code"
}

@test "the PATH variable contains dotfiles/.bin path" {
  source "dotfiles/profile.d/path"
  run echo "$PATH"
  assert_success
  assert_output_match "^${TMP_DIR}\/\.bin:"
}

@test "paths will display each path from PATH variable on a new line" {
  source "dotfiles/profile.d/path"
  run paths
  assert_success
  assert_line_match 0 "([^\/]*[\/])*[^\/]+"
  assert [ -d "${lines[0]}" ]
  assert_line_match 1 "([^\/]*[\/])*[^\/]+"
  assert [ -d "${lines[1]}" ]
}
