load data

@test "shellcheck on scripts" {
  if [ ${#scripts[@]} -eq 0 ]; then
    skip "- no scripts to check"
  fi
  shellcheck -x "${scripts[@]}"
}

@test "shellcheck on libraries" {
  if [ ${#libs[@]} -eq 0 ]; then
    skip "- no libraries to check"
  fi
  shellcheck -xe SC2148 "${libs[@]}"
}
