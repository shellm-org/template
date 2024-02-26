BINS="bin/{{ shellm_package_script_name }}"
DEPS="github.com/shellm-org/core"
BASH_COMPLETIONS="completion/{{ shellm_package_script_name }}.bash"
ZSH_COMPLETIONS="completion/{{ shellm_package_script_name }}.zsh"

SHELLM_LIBS="lib/{{ shellm_package_script_name.replace('-', '_') }}.sh"
