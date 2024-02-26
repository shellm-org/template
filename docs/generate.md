# Generating a project

To generate a project, run the following command:

```bash
copier copy --trust "https://github.com/shellm-org/template.git" /path/to/your/new/project
```

Or with a shorter command:

```bash
copier copy --trust "gh:shellm-org/template" /path/to/your/new/project
```

You can even generate a project without installing copier, using `pipx`:

```bash
pipx run copier copy --trust "gh:shellm-org/template" /path/to/your/new/project
```

## Questions

*The following examples are not up-to-date,
they simply illustrate how the template works.*

Copier will ask you to answer some questions:

```
Your project name
project_name? Format: str
🎤 [None]: My Project
```

The project name can use spaces and capitals.
It will be used as the main heading in the README for example.

---

```
Your project description
project_description? Format: str
🎤 [None]: My super project!
```

The project description can be as long as you want,
and use any character you want.

---

```
Your full name
author_fullname? Format: str
🎤 [None]: Timothée Mazzucotelli
```

The full name will appear as "author" in the project's metadata.

---

```
Your email
author_email? Format: str
🎤 [None]: pawamoy@pm.me
```

The email will appear as "author email" in the project's metadata.

---

```
Your username (e.g. on GitHub)
author_username? Format: str
🎤 [None]: pawamoy
```

The username you are using on the git repository provider.

---

```
Your repository provider
repository_provider? Format: str
🎤
(1) github.com
Choice [1]: 
```

The repository provider on which you plan to store your project.
This template only supports GitHub, but the question is left in
case we add support for more providers in the future.

---

```
Your repository namespace
repository_namespace? Format: str
🎤 [pawamoy]: 
```

The namespace (or account) on which the project will be stored.
It defaults to the username you provided.

---

```
Your repository name
repository_name? Format: str
🎤 [my-project]: 
```

The repository name on the selected provider.
It defaults to a slugified version of your project's name.

---

```
The name of the person/entity holding the copyright
copyright_holder? Format: str
🎤 [Timothée Mazzucotelli]: 
```

The name of the person or entity holding the copyright on the project.
It defaults to the full name your provided.

---

```
The email of the person/entity holding the copyright
copyright_holder_email? Format: str
🎤 [pawamoy@pm.me]: 
```

The email of the person or entity holding the copyright on the project.
It defaults to the email your provided.

---

```
The copyright date
copyright_date? Format: str
🎤 [2021]: 
```

The date to apply to the copyright.
It defaults to the current year.

---

```
Your project's license
copyright_license? Format: str
🎤
(1) Academic Free License v3.0
(2) Apache License 2.0
(3) Artistic License 2.0
(4) BSD 2-Clause "Simplified" License
(5) BSD 3-Clause Clear License
(6) BSD 3-Clause "New" or "Revised" License
(7) Boost Software License 1.0
(8) Creative Commons Attribution 4.0
(9) Creative Commons Attribution Share Alike 4.0
(10) Creative Commons Zero v1.0 Universal
(11) Do What The F*ck You Want To Public License
(12) Educational Community License v2.0
(13) Eclipse Public License 1.0
(14) Eclipse Public License 2.0
(15) European Union Public License 1.1
(16) European Union Public License 1.2
(17) GNU Affero General Public License v3.0
(18) GNU General Public License v2.0
(19) GNU General Public License v3.0
(20) GNU Lesser General Public License v2.1
(21) GNU Lesser General Public License v3.0
(22) ISC License
(23) LaTeX Project Public License v1.3c
(24) MIT License
(25) Mozilla Public License 2.0
(26) Microsoft Public License
(27) Microsoft Reciprocal License
(28) University of Illinois/NCSA Open Source License
(29) SIL Open Font License 1.1
(30) Open Software License 3.0
(31) PostgreSQL License
(32) The Unlicense
(33) zlib License
Choice [22]: 
```

A license from choosealicence.com.
It defaults to ISC License (my personal preference).

---

```
Your shellm package source name (for `shellm source NAME` in scripts/libraries)
shellm_package_source_name? Format: str
🎤 [my_project]: 
```

The name that will be used to source your package in shell scripts and libraries.

---

```
Your CLI name if any (for use in the shell)
shellm_package_script_name? Format: str
🎤 [my-project]: 
```

The name of the command users will type in the command line
to run your program.

## Output

At this point, Copier will generate the project in the specified directory:

```
    create  mkdocs.yml
    create  .copier-answers.yml
    create  README.md
    create  Makefile
    create  LICENSE
    create  CREDITS.md
    create  CONTRIBUTING.md
    create  CODE_OF_CONDUCT.md
    create  CHANGELOG.md
    create  .gitignore
    create  tests/
    create  tests/test_cli.sh
    create  lib/
    create  lib/my_project.sh
    create  bin/my_project
    create  scripts/
    create  scripts/make
    create  docs/
    create  docs/index.md
    create  docs/credits.md
    create  docs/contributing.md
    create  docs/code_of_conduct.md
    create  docs/changelog.md
    create  docs/reference/
    create  docs/reference/cli.md
    create  docs/css/
    create  docs/css/mkdocstrings.css
    create  .github/
    create  .github/FUNDING.yml
    create  .github/workflows/
    create  .github/workflows/ci.yml
    create  .github/ISSUE_TEMPLATE/
    create  .github/ISSUE_TEMPLATE/feature_request.md
    create  .github/ISSUE_TEMPLATE/bug_report.md
```

See the next chapter to learn how to work on this new project.
