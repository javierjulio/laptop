SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && dirname $PWD )" # http://stackoverflow.com/a/246128
FIXTURES_ROOT="${BATS_TEST_DIRNAME}/fixtures"

export PATH="${SCRIPT_ROOT}:${FIXTURES_ROOT}:$PATH"

TMP_DIR="${BATS_TEST_DIRNAME}/tmp"

create_tmp_file() {
  (
    cd $TMP_DIR || exit
    mkdir -p "$(dirname "$1")" && touch "$1";
  )
}

common_setup() {
  mkdir -p "$TMP_DIR"
  export HOME="${TMP_DIR}"
  . link_dotfiles # creates symlinks in tmp dir
}

teardown() {
  rm -rf "$TMP_DIR"
}

flunk() {
  { if [ "$#" -eq 0 ]; then cat -
    else echo "$@"
    fi
  } | sed "s:${BATS_TMPDIR}:TEST_DIR:g" >&2
  return 1
}

assert_success() {
  if [ "$status" -ne 0 ]; then
    flunk "command failed with exit status $status"
  elif [ "$#" -gt 0 ]; then
    assert_output "$1"
  fi
}

assert_failure() {
  if [ "$status" -eq 0 ]; then
    flunk "expected failed exit status"
  elif [ "$#" -gt 0 ]; then
    assert_output "$1"
  fi
}

assert_equal() {
  if [ "$1" != "$2" ]; then
    { echo "expected: $1"
      echo "actual:   $2"
    } | flunk
  fi
}

assert_output_match() {
  if [[ ! "${output}" =~ ${1} ]]; then
    echo "regex:  ${1}"
    echo "actual: ${output}"
    return 1
  fi
}

assert_output() {
  local expected
  if [ $# -eq 0 ]; then expected="$(cat -)"
  else expected="$1"
  fi
  assert_equal "$expected" "$output"
}

assert_line() {
  if [ "$1" -ge 0 ] 2>/dev/null; then
    assert_equal "$2" "${lines[$1]}"
  else
    local line
    for line in "${lines[@]}"; do
      if [ "$line" = "$1" ]; then return 0; fi
    done
    flunk "expected line \`$1'"
  fi
}

refute_line() {
  if [ "$1" -ge 0 ] 2>/dev/null; then
    local num_lines="${#lines[@]}"
    if [ "$1" -lt "$num_lines" ]; then
      flunk "output has $num_lines lines"
    fi
  else
    local line
    for line in "${lines[@]}"; do
      if [ "$line" = "$1" ]; then
        flunk "expected to not find line \`$line'"
      fi
    done
  fi
}

refute() {
  if "$@"; then
    flunk "succeeded: $@"
  fi
}

assert() {
  if ! "$@"; then
    flunk "failed: $@"
  fi
}
