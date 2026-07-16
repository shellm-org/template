# Working on a project


The generated project has this structure:

```tree
your_project ------------------- # your freshly created project!
    .copier-answers.yml -------- # answers to the questions asked when generating
    .editorconfig -------------- # 
    .envrc --------------------- # 
    .github -------------------- # GitHub configuration
        ISSUE_TEMPLATE --------- # issue templates
            bug_report.md ------ # 
            config.yml --------- # 
            feature_request.md - # 
        workflows -------------- # GitHub Actions workflows
            ci.yml ------------- # 
            release.yml -------- # 
    .gitignore ----------------- # 
    CHANGELOG.md --------------- # 
    CODE_OF_CONDUCT.md --------- # 
    CONTRIBUTING.md ------------ # 
    LICENSE -------------------- # 
    Makefile ------------------- # 
    README.md ------------------ # 
    bin ------------------------ # command-line scripts
        your_script ------------ # the main CLI entry point
    completion ----------------- # shell completion files
        your_script.bash ------- # Bash completion
        your_script.zsh -------- # Zsh completion
    config --------------------- # tools configuration files
        git-changelog.toml ----- # 
        vscode ----------------- # VSCode settings
            launch.json -------- # 
            settings.json ------ # 
            tasks.json --------- # 
    demo ----------------------- # demo assets
        input ------------------ # demo input/script
    docs ----------------------- # documentation pages
        changelog.md ----------- # 
        code_of_conduct.md ----- # 
        contributing.md -------- # 
        credits.md ------------- # 
        css -------------------- # extra CSS files
            material.css ------- # 
            mkdocstrings.css --- # 
        index.md --------------- # 
        license.md ------------- # 
    lib ------------------------ # shellm libraries
        your_script.sh --------- # the main shell library
    man ------------------------ # manual pages
        your_script.1 ---------- # CLI man page
        yourscript.sh.3 -------- # library man page
    mkdocs.yml ----------------- # docs configuration
    package.sh ----------------- # packaging script
    scripts -------------------- # helper scripts
        gen_credits.py --------- # script to generate credits
        gen_ref_nav.py --------- # script to generate code reference nav
        make ------------------- # a convenience script to run tasks
    src ------------------------ # the source code directory
        your_package ----------- # your package
            debug.py ----------- # debugging utilities
    templates ------------------ # README template parts
        readme.md -------------- # 
        readme_demo.md --------- # 
        readme_installation.md - # 
        readme_summary.md ------ # 
        readme_usage.md -------- # 
    tests ---------------------- # the tests directory
        data.bash -------------- # test data/fixtures
        quality ---------------- # quality tests
            data.bash ---------- # 
            test_shellcheck.bats # shellcheck tests
            test_shellman.bats - # shellman tests
        test_your_script.bats -- # unit tests for your script
    wiki ----------------------- # wiki assets
        bin -------------------- # 
        lib -------------------- # 
```

When the author username is `pawamoy`, an extra
`docs/.overrides/main.html` file is also generated
for the documentation theme.

## Environment

The project is configured to use [direnv](https://direnv.net/).
If direnv is loaded in your shell, allow it in the project with
`direnv allow`.

In the rest of the documentation, we will use `make` commands.
See [Tasks](#tasks) to learn more.

## Dependencies

Dependencies are managed with [Basher](https://github.com/basherpm/basher),
a package manager for shell scripts and libraries.

### Runtime dependencies

Runtime dependencies are declared in `package.sh`
through the `DEPS` variable:

```bash title="package.sh"
DEPS="github.com/shellm-org/core"
```

Each entry is a Git repository in the form
`provider/namespace/repo` or `github.com/namespace/repo`.
Multiple dependencies are separated by colons:

```bash title="package.sh"
DEPS="github.com/shellm-org/core:github.com/owner/other-dep"
```

When a user installs your package with basher,
these dependencies are cloned and installed automatically:

```bash
basher install your_namespace/your_project
```

### Development dependencies

During development, you need Basher itself installed.
Then link your local clone of the project and install its dependencies:

```bash
cd your_project
basher link . your_namespace/your_project
```

This will resolve the `DEPS` listed in `package.sh`
and make them available under `$BASHER_ROOT/packages`.

Tests also rely on Basher packages such as
`bats-core/bats-core`, `ztombol/bats-assert`,
`ztombol/bats-support`, and `github.com/shellm-org/cover`.
These are installed by the CI workflow and can be installed
locally the same way:

```bash
basher install bats-core/bats-core
basher install ztombol/bats-assert
basher install ztombol/bats-support
basher install github.com/shellm-org/cover
```

### Adding or updating dependencies

To add a new runtime dependency, edit `package.sh`
and append the dependency to the `DEPS` variable.
To remove one, delete its entry. After changing `package.sh`,
run `basher link .` again so the new dependencies are
fetched and linked in your development environment.

## Tasks

TODO: Design task system and document it.

To run a task, use `make TASK [ARG=VALUE...]`.
You can run multiple tasks at once: `make TASK1 ARG=VALUE TASK2`.
You can list the available tasks with `make help`.

Available tasks:

- `all`: Run quality and unit tests.
- `check`: Run the quality tests.
  See [the Quality Analysis section](#quality-analysis).
- `check-quality`: Run shellcheck style tests.
  See [the check-quality section](#check-quality).
- `check-docs`: Run shellman documentation tests.
  See [the check-docs section](#check-docs).
- `doc`: Generate man pages.
  See [the Man pages section](#man-pages).
- `help`: Print the available tasks.
- `man`: Generate man pages.
- `readme`: Generate the README from templates.
- `test`: Run the unit tests.
  See [the Tests section](#tests).


### VSCode setup

If you work in VSCode, we provide configuration files
in `config/vscode/`:

- `launch.json`
- `settings.json`
- `tasks.json`

Copy or symlink them into `.vscode/` in your workspace as needed.

### Makefile

You will notice a Makefile in the repository.
It defines the main tasks used to develop, test, and document
your shellm project. Use `make help` to list them.

## Workflow

Now you can start writing and editing code in `lib/your_script.sh`
and command-line scripts in `bin/your_script`.

- You can run a quality analysis with `make check`.
- Once you wrote tests for your new code,
  you can run the test suite with `make test`.
- You can generate man pages with `make man`
  and the README with `make readme`.
- Once you are ready to publish a new release,
  update the changelog with `git-changelog`,
  then use `package.sh` to build the release artifact.

To summarize, the typical workflow is:

```bash
: (write code in lib/your_script.sh and bin/your_script)

: (write tests in tests/test_your_script.bats)
make test  # to run the test suite

make check  # to check if everything is OK

make man  # to generate the man pages
make readme  # to generate the README

: (commit your changes)

: (update the changelog with git-changelog)

: (build and publish the release with package.sh)
```

## Quality analysis

The quality checks are started with:

```
make check
```

This action is actually a composition of several checks:

- `check-quality`: Run shellcheck on scripts and libraries.
- `check-docs`: Run shellman to check that man pages can be generated.

TODO: Implement and document each check.

## Continuous Integration

The quality checks and tests are executed in parallel
in a [GitHub Workflow](https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions).
The CI is configured in `.github/workflows/ci.yml`.

## Changelog

Changelogs are absolutely useful when your software
is updated regularly, to inform your users about the new features
that were added or the bugs that were fixed.

But writing a changelog manually is a cumbersome process.

This is why we offer, with this template,
a way to automatically update the changelog.
There is one requirement though for it to work:
you must use the
[Angular commit message convention](https://github.com/angular/angular/blob/dcb9deb3631ff4e839f738f2fb97ca6b894256ef/CONTRIBUTING.md#commit).

For a quick reference:

```
<type>[(scope)]: Subject

[Body]
```

Scope and body are optional. Type can be:

- `build`: About packaging and building releases.
- `chore`: About packaging or repo/files management.
- `ci`: About Continuous Integration.
- `docs`: About documentation.
- `feat`: New feature.
- `fix`: Bug fix.
- `perf`: About performance.
- `refactor`: Changes which are not features nor bug fixes.
- `style`: A change in code style/format.
- `tests`: About tests.

The two most important are `feat` and `fix` types.
For other types of commits, you can do as you like.

Subject (and body) must be valid Markdown.
If you write a body, please add issues references at the end:

```
Body.

References: #10, #11.
Fixes #15.
```

Examples:

```
feat: Add training route
```

```
fix: Stop deleting user data
```

Following that convention will allow to generate
new entries in the changelog while following the rules
of [semantic versioning](https://semver.org/).

Once you are ready to publish a new release of your package,
run the following command:

```
git-changelog
```

This will update the changelog in-place, using the latest,
unpublished-yet commits.

If this group of commits contains only bug fixes (`fix:`)
and/or commits that are not interesting for users (`chore:`, `style:`, etc.),
the changelog will gain a new **patch** entry.
It means that the new suggested version will be a patch bump
of the previous one: `0.1.1` becomes `0.1.2`.

If this group of commits contains at least one feature (`feat:`),
the changelog will gain a new **minor** entry.
It means that the new suggested version will be a minor bump
of the previous one: `0.1.1` becomes `0.2.0`.

If there is, in this group, a commit whose body contains
something like `Breaking change`,
the changelog will gain a new **major** entry,
unless the version is still an "alpha" version
(starting with 0), in which case it gains a **minor** entry.
It means that the new suggested version will be a major bump
of the previous one: `1.2.1` becomes `2.0.0`,
but `0.2.1` is only bumped up to `0.3.0`.
Moving from "alpha" status to "beta" or "stable" status
is a choice left to the developers,
when they consider the package is ready for it.

Finally, once your changelog has been updated,
make sure its contents are correct (add, remove or edit anything
you need), and use the new version (the one that was added
into the changelog) to create a new release:

```
package.sh
```

...where x.y.z is the version added in the changelog.

## Releases

As seen in the previous section, you can use `package.sh`
to publish new versions of the shellm package.

Usually, just before running `package.sh`,
you run `git-changelog` to update the changelog and
use the newly added version when tagging the release.

For example, if after running `git-changelog`, the diff
shows a new `0.5.1` entry in the changelog, you must
release this exact same version, e.g. by tagging `v0.5.1`.

The `package.sh` script packages the script, library,
and completion files so they can be installed with
[Basher](https://github.com/basherpm/basher).

## Documentation

The documentation is built with [Mkdocs](https://www.mkdocs.org/),
the [Material for Mkdocs](https://squidfunk.github.io/mkdocs-material/) theme,
and the [mkdocstrings](https://github.com/pawamoy/mkdocstrings) plugin
with the shell handler.

### Writing

The pages are written in Markdown, and thanks to `mkdocstrings`,
your shell script help text and comments can be injected into pages.

The documentation configuration is written into `mkdocs.yml`,
at the root of the project. The Markdown pages are written
in the `docs/` directory. You can use any level of nesting you want.
The left-sidebar navigation is configured through the `nav` key
in `mkdocs.yml`.

For example, with these docs structure:

```tree
docs
    changelog.md
    index.md
    reference
        cli.md
        logic.md
```

...you can have these navigation items in `mkdocs.yml`:

```yaml title="mkdocs.yml"
nav:
- Overview: index.md
- Code Reference:
  - cli: reference/cli.md
  - logic: reference/logic.md
- Changelog: changelog.md
```

Note that we matched the sections in the navigation with the folder tree,
but that is not mandatory.

`mkdocstrings` allows you to inject documentation of shell scripts
in Markdown pages with the following syntax:

```md
::: path/to/script
    OPTIONS
```

...where `OPTIONS` is a YAML block containing configuration options
for both the selection of shell objects and their rendering.

For more information about `mkdocstrings`,
check [its documentation](https://pawamoy.github.io/mkdocstrings).

### Serving

MkDocs provides a development server with files watching and live-reload.
Run `mkdocs serve` to serve your documentation on `localhost:8000`.

If you run it in a remote host (Linux VM) and would like to access it
from your local browser, bind the server to 0.0.0.0 instead:

```bash
mkdocs serve -a 0.0.0.0:8000
```

If needed, you can also change the port used:

```bash
mkdocs serve -a 0.0.0.0:5000
```

### Deploying

MkDocs has a `gh-deploy` command that will deploy
your documentation on GitHub pages:

```bash
mkdocs gh-deploy
```

If you'd prefer to deploy on ReadTheDocs instead,
you will likely have to write
a `readthedocs.yml` configuration file
and enable the project on ReadTheDocs.
