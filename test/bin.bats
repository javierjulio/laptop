#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "displays local ip address" {
  run local-ip
  assert_success
  assert_output_match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
}

@test "displays remote ip address" {
  run remote-ip
  assert_success
  assert_output_match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
}
