#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "ensure HOME is now the TMP_DIR path" {
  run echo "$HOME"
  assert_equal "$TMP_DIR" "$HOME"
}

@test "first path in PATH is now TMP_DIR/.bin and it exists" {
  run echo "${PATH%%:*}"
  assert_output "${TMP_DIR}/.bin"
  assert [ -d "${lines[0]}" ]
}

@test "urls: with no input or file, it fails with error message" {
  [ "$CI" = "true" ] && skip "this fails on CI due to [-t 0] check"

  run urls
  assert_failure
  assert_output "urls: no file arg or pipe input provided"
}

@test "urls: with empty input, it fails with error message" {
  run bash -c 'echo "testing" | urls'
  assert_failure
  assert_output "urls: no URLs found"
}

@test "urls: with empty file, it fails with error message" {
  create_tmp_file "file.txt"
  run urls "${TMP_DIR}/file.txt"
  assert_failure
  assert_output "urls: no URLs found"
}

@test "urls: with file but no urls, it fails with error message" {
  create_tmp_file "file.txt"
  echo "first line" >> "${TMP_DIR}/file.txt"
  echo "second line" >> "${TMP_DIR}/file.txt"
  run urls "${TMP_DIR}/file.txt"
  assert_failure
  assert_output "urls: no URLs found"
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
  assert_output_match '^([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+|[a-f0-9:]+)$'
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

@test "paths displays each path in PATH on a new line" {
  run paths
  assert_success
  assert_line_match 0 "([^\/]*[\/])*[^\/]+"
  assert_line_match 1 "([^\/]*[\/])*[^\/]+"
  assert_line_match 2 "([^\/]*[\/])*[^\/]+"
}

@test "start-development displays an error if no server related file found" {
  run start-development
  assert_failure
  assert_output "Error: No dev server found. Looking for a Procfile.docker, Procfile.dev, Procfile or package.json file."
}

@test "repeat-until-exit repeats successful commands and stops on failure" {
  run repeat-until-exit bash -c 'echo attempt >> "$1"; [ "$(wc -l < "$1")" -lt 3 ]' _ "${TMP_DIR}/attempts"

  assert_success
  assert_line "Run 1 finished."
  assert_line "Run 2 finished."
  assert_line "Exited after 2 times."
  assert_equal 3 "$(wc -l < "${TMP_DIR}/attempts" | tr -d ' ')"
}

@test "repeat-until-exit stops at the maximum iteration count" {
  run repeat-until-exit true

  assert_success
  assert_line "Run 500 finished."
  assert_line "Max iteration of 500 reached."
}
