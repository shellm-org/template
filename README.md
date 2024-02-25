# shellm template

[![ci](https://github.com/shellm-org/template/workflows/ci/badge.svg)](https://github.com/shellm-org/template/actions?query=workflow%3Aci)
[![documentation](https://img.shields.io/badge/docs-mkdocs%20material-blue.svg?style=flat)](https://shellm-org.github.io/template/)
[![gitter](https://badges.gitter.im/join%20chat.svg)](https://app.gitter.im/#/room/#shellm-org/community:gitter.im)

[Copier](https://github.com/copier-org/copier) template
for [shellm](https://github.com/shellm-org) projects.

## Features

- [Basher](https://github.com/basherpm/basher) setup (installation, dependencies)
- Pre-configured tools for quality analysis and testing:
  [shellcheck](https://github.com/koalaman/shellcheck),
  [bats](https://github.com/bats-core/bats-core)
- Documentation built with [MkDocs](https://github.com/mkdocs/mkdocs)
  ([Material theme](https://github.com/squidfunk/mkdocs-material)
  and "autodoc" [mkdocstrings plugin](https://github.com/mkdocstrings/mkdocstrings))
- Support for GitHub workflows
- Auto-generated `CHANGELOG.md` from Git (conventional) commits
- All licenses from [choosealicense.com](https://choosealicense.com/appendix/)

## Quick setup and usage

Make sure all the
[requirements](https://shellm-org.github.io/template/requirements)
are met, then:

```bash
copier copy --trust "https://github.com/shellm-org/template.git" /path/to/your/new/project
```

Or even shorter:

```bash
copier copy --trust "gh:shellm-org/template" /path/to/your/new/project
```

See the [documentation](https://shellm-org.github.io/template)
for more details.
