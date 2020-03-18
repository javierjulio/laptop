#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
  source "dotfiles/profile.d/path"
}

@test "shellcheck.sh runs successfully" {
  run shellcheck.sh
  assert_success
}

@test "shellcheck.sh runs from tmp directory due to PATH" {
  run which shellcheck.sh
  assert_success
  assert_output "${TMP_DIR}/.bin/shellcheck.sh"
}

@test "local-ip displays your local IP address" {
  run local-ip
  assert_success
  assert_output_match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
}

@test "local-ip runs from tmp directory due to PATH" {
  run which local-ip
  assert_success
  assert_output "${TMP_DIR}/.bin/local-ip"
}

@test "remote-ip displays your remote IP address" {
  run remote-ip
  assert_success
  assert_output_match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
}

@test "remote-ip runs from tmp directory due to PATH" {
  run which remote-ip
  assert_success
  assert_output "${TMP_DIR}/.bin/remote-ip"
}

@test "delete-ds-store deletes all .DS_Store files recursively" {
  create_tmp_file ".DS_Store"
  create_tmp_file "sub/.DS_Store"
  create_tmp_file "sub/sub/.DS_Store"

  run cd $TMP_DIR && delete-ds-store

  assert_success
  assert [ -d "${TMP_DIR}" ]
  refute [ -f "${TMP_DIR}/.DS_Store" ]
  assert [ -d "${TMP_DIR}/sub" ]
  refute [ -f "${TMP_DIR}/sub/.DS_Store" ]
  assert [ -d "${TMP_DIR}/sub/sub" ]
  refute [ -f "${TMP_DIR}/sub/sub/.DS_Store" ]
}

@test "delete-ds-store runs from tmp directory due to PATH" {
  run which delete-ds-store
  assert_success
  assert_output "${TMP_DIR}/.bin/delete-ds-store"
}
