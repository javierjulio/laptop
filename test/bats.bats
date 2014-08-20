#!/usr/bin/env bats

load test_helper

setup() {
  export HOME="${LAPTOP_TEST_DIR}"
}

@test "installs Bats if not already installed" {
  run bats
  assert_success
  assert_line 0 "Installing Bats..."
  assert_line 1 "Cloning into '${LAPTOP_TEST_DIR}/.bats'..."
}

@test "updates Bats if installation detected" {
  bats
  run bats
  assert_success
  assert_line 0 "Updating Bats..."
  assert_line 1 "Already up-to-date."
}
