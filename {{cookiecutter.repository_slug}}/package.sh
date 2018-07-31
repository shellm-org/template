BINS="bin/{{cookiecutter.package_name}}"  #:bin/other-script
LIBS="lib/{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.sh"
DEPS=gitlab.com/shellm/core:gitlab.com/shellm/doc
BASH_COMPLETIONS="cmp/{{cookiecutter.package_name}}.completion.bash"
ZSH_COMPLETIONS="cmp/{{cookiecutter.package_name}}.completion.zsh"
