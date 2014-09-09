#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
  export CLOUD66_DIR="${HOME}"
}

@test "installs Cloud 66 toolbelt" {
  run cloud66
  assert_success
  assert_line 0 "Installing latest Cloud 66 toolbelt..."
}
