# {{cookiecutter.repository_slug}}
{{cookiecutter.repository_description}}

- Authors: https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/AUTHORS.md
- Changelog: https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/CHANGELOG.md
- Contributing: https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/CONTRIBUTING.md
- Documentation: https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/wiki
- License: ISC - https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/LICENSE

- [Installation](#installation)
- [Usage](#installation)

## Installation
Installation with [basher](https://github.com/basherpm/basher):
```bash
basher install {{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}
```

Installation from source:
```bash
git clone https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}
cd {{cookiecutter.repository_slug}}
sudo ./install.sh
```

## Usage
Command-line:
```
{{cookiecutter.package_name}} -h
```

As a library:
```bash
# with basher's include
include {{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}} lib/{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.sh
# with shellm's include
shellm-include {{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}} lib/{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.sh
```
