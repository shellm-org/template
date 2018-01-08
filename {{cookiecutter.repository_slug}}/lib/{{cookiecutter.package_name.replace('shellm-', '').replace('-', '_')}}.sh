if shellm-ndef; then
shellm-define "
  {{cookiecutter.package_name.replace('shellm-', '')}}"

## \brief {{cookiecutter.repository_description}}

## \fn {{cookiecutter.package_name.replace('shellm-', '')}}
{{cookiecutter.package_name.replace('shellm-', '')}}() {
  :  # code
}

fi  #  __{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_').upper()}}_SH
