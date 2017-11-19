BINS="bin/{{cookiecutter.package_name}}"  #:bin/other-script
LIBS="lib/{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.sh"
DEPS=shellm-org/shellm-shellman  #:user2/repo2
BASH_COMPLETIONS="cmp/{{cookiecutter.package_name}}.completion.bash"
ZSH_COMPLETIONS="cmp/{{cookiecutter.package_name}}.completion.zsh"

case "$0" in
  ${BASHER_ROOT}/libexec/basher-_deps)
    ${BASHER_PACKAGES_PATH}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/install.sh "${PREFIX:-$BASHER_PREFIX}"
  ;;  # let run to install deps, run install.sh as well

  ${BASHER_ROOT}/libexec/basher-_unlink-bins)
    IFS=: read -a libs <<< "${LIBS}"
    for lib in "${libs[@]}"; do
      rm -f "${PREFIX:-$BASHER_PREFIX}/lib/shellm/${lib#*/}"
    done
  ;;  # let run, also "unlink" libs
  ${BASHER_ROOT}/libexec/basher-_unlink-completions) : ;;  # let run
  ${BASHER_ROOT}/libexec/basher-_unlink-man) : ;;  # let run

  ${BASHER_ROOT}/libexec/basher-_link-bins) exit 0 ;; # do nothing
  ${BASHER_ROOT}/libexec/basher-_link-completions) exit 0 ;;  # do nothing
  ${BASHER_ROOT}/libexec/basher-_link-man) exit 0 ;;  # do nothing
esac
