#!/usr/bin/env bats

load test_helper

setup() {
  common_setup
}

@test "the files in dotfiles root are symlinked" {
  run link_dotfiles
  assert_success

  for file in $(find dotfiles -type f -maxdepth 1 -exec basename {} \;)
  do
    assert [ -f "${TMP_DIR}/.${file}" ]
  done
}

@test "the dotfiles/bin directory is symlinked with files" {
  run link_dotfiles
  assert_success

  assert [ -d "${TMP_DIR}/.bin" ]

  for file in $(basename dotfiles/bin/*)
  do
    assert [ -f "${TMP_DIR}/.bin/${file}" ]
  done
}

@test "the dotfiles/grc directory is symlinked with files" {
  run link_dotfiles
  assert_success

  assert [ -d "${TMP_DIR}/.grc" ]
  assert [ -f "${TMP_DIR}/.grc/conf.todos" ]
}

@test "the dotfiles/profile.d directory is symlinked with files" {
  run link_dotfiles
  assert_success

  assert [ -d "${TMP_DIR}/.profile.d" ]

  for file in $(basename dotfiles/profile.d/*)
  do
    assert [ -f "${TMP_DIR}/.profile.d/${file}" ]
  done
}
