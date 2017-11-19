BINS="bin/{{cookiecutter.package_name}}"  #:bin/other-script
LIBS="lib/{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.sh"
DEPS=shellm-org/shellm-shellman  #:user2/repo2
BASH_COMPLETIONS="cmp/{{cookiecutter.package_name}}.completion.bash"
ZSH_COMPLETIONS="cmp/{{cookiecutter.package_name}}.completion.zsh"
