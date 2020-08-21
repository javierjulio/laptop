#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "log_info prints a message with timestamp" {
  source "helpers.sh"
  run log_info "Test"
  assert_success
  assert_output_match "^[0-9]{2}:[0-9]{2}:[0-9]{2} +\- +Test$"
}
