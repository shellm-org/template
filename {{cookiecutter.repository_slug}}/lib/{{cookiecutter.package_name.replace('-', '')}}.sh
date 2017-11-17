if ndef __{{cookiecutter.package_name.replace('-', '').upper()}}_SH; then
define __{{cookiecutter.package_name.replace('-', '').upper()}}_SH "{{cookiecutter.package_name.replace('-', '_')}}"

## \brief {{cookiecutter.repository_description}}

## \fn {{cookiecutter.package_name.replace('-', '_')}}
{{cookiecutter.package_name.replace('-', '_')}}() {
  :  # code
}

fi  # __{{cookiecutter.package_name.upper()}}_SH
