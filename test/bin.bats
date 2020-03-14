#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "local-ip displays your local IP address" {
  run local-ip
  assert_success
  assert_output_match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
}

@test "remote-ip displays your remote IP address" {
  run remote-ip
  assert_success
  assert_output_match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
}
