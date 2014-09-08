#!/usr/bin/env bats

load test_helper

setup() {
  export HOME="${LAPTOP_TEST_DIR}"
  export CODA_DIR="${HOME}"
}

@test "completes successfully" {
  run coda
  assert_success
}

@test "outputs messages" {
  run coda
  assert_success
  assert_line 0 "Installing Coda 2 Syntax Modes..."
  assert_line 1 "Cloning into '$CODA_DIR/Bash.mode'..."
  assert_line 2 "Cloning into '$CODA_DIR/CoffeeScript.mode'..."
}

@test "creates directories for each installed mode" {
  run coda
  assert_success
  [ -d "$CODA_DIR/Bash.mode" ]
  [ -d "$CODA_DIR/CoffeeScript.mode" ]
}
