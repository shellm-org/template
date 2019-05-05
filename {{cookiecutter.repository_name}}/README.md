# {{cookiecutter.project_name}}
{{cookiecutter.project_description}}

- Changelog: https://{{cookiecutter.repository_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_name}}/CHANGELOG.md
- Contributing: https://{{cookiecutter.repository_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_name}}/CONTRIBUTING.md
- Documentation: https://{{cookiecutter.repository_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_name}}/wiki
- License: ISC - https://{{cookiecutter.repository_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_name}}/LICENSE

## Installation
Installation with [basher](https://github.com/basherpm/basher):
```bash
basher install {% if cookiecutter.repository_provider != "github.com" %}{{ cookiecutter.repository_provider}}/{% endif %}{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_name}}
```

## Usage
Command-line:
```
{{cookiecutter.script_name}} -h
```

As a library:
```bash
shellm source {{cookiecutter.repository_namespace}}/{{cookiecutter.repository_name}}
```
