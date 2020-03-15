#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
  source "dotfiles/profile.d/path"
}

@test "run shellcheck" {
  run ./shellcheck.sh
  assert_success
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

@test "delete-ds-store deletes all .DS_Store files recursively" {
  create_tmp_file ".DS_Store"
  create_tmp_file "sub/.DS_Store"
  create_tmp_file "sub/sub/.DS_Store"

  run cd $TMP_DIR && delete-ds-store

  assert_success
  refute [ -f "${TMP_DIR}/.DS_Store" ]
  refute [ -f "${TMP_DIR}/sub/.DS_Store" ]
  refute [ -f "${TMP_DIR}/sub/sub/.DS_Store" ]
}
