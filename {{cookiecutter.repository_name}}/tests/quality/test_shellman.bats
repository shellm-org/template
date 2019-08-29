load data

get_tag() {
  local re='^[[:space:]]*##[[:space:]]*[@\]'"$1"'[[:space:]]'
  grep "${re}" "$2" | expand | sed 's/'"${re}"'*//'
  # shellcheck disable=SC2086
  return ${PIPESTATUS[0]}
}

has_tag() {
  local script status=${success}
  local checked_tag="$1"
  shift
  for script in "$@"; do
    if ! get_tag "${checked_tag}" "${script}" >/dev/null; then
      echo "${script}: missing tag ${checked_tag}"
      status=${failure}
    fi
  done
  return ${status}
}

usage_matches_script_name() {
  local script usage usages basename status=${success}
  for script in "$@"; do
    readarray -t usages <<<"$(get_tag "usage" "${script}" | cut -d' ' -f1,2)"
    for usage in "${usages[@]}"; do
      basename="$(basename "${script}")"
      if [ "${usage% *}" != "${basename}" ] && [ "${usage// /-}" != "${basename}" ]; then
        echo "${script}: usage '${usage}' does not match script name"
        status=${failure}
      fi
    done
  done
  return ${status}
}

@test "scripts have usage tag" {
  has_tag "usage" ${scripts}
}

@test "scripts have brief tag" {
  has_tag "brief" ${scripts}
}

@test "scripts usages match names" {
  usage_matches_script_name ${scripts}
}
