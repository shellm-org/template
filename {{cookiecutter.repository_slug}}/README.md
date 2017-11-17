# {{cookiecutter.repository_slug}}
{{cookiecutter.repository_description}}

- [Installation](#installation)
- [Documentation](#documentation)
- [Development](#development)
- [History](#history)
- [Credits](#credits)
- [License](#license)

## Installation
Installation can be done through
[basher](https://github.com/basherpm/basher) and
[bpkg](https://github.com/bpkg/bpkg), with:
```bash
basher install {{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}
bpkg install {{cookiecutter.package_name}}  # local installation
sudo bpkg install {{cookiecutter.package_name}} -g  # global installation
```

Install from source:
```bash
git clone https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}
cd {{cookiecutter.repository_slug}}
sudo make install
# or ./install.sh LOCATION_PREFIX
```

## Documentation
See the [{{cookiecutter.package_name}} wiki](https://{{cookiecutter.remote_provider}}/{{cookiecutter.repository_namespace}}/{{cookiecutter.repository_slug}}/wiki).

## Development
See [CONTRIBUTING](CONTRIBUTING.md).

## History
See [CHANGELOG](CHANGELOG.md).

## Credits
See [AUTHORS](AUTHORS.md).

## License
See [LICENSE](LICENSE).
