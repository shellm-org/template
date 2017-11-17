#!/usr/bin/env bash
set -e

PREFIX="$1"
if [ ! -n "$1" ]; then
  { echo "usage: $0 <prefix>"
    echo "  e.g. $0 /usr/local"
  } >&2
  exit 1
fi

APP_ROOT="$(dirname "$(readlink -f "$0")")"
mkdir -p "${PREFIX}"/{bin,lib/shellm,share/man/man{1,3}}
cp -R "${APP_ROOT}"/bin/* "${PREFIX}"/bin
cp -R "${APP_ROOT}"/lib/* "${PREFIX}"/lib/shellm
cp "${APP_ROOT}"/man/*.1 "${PREFIX}"/share/man/man1
cp "${APP_ROOT}"/man/*.3 "${PREFIX}"/share/man/man3

echo "Installed {{cookiecutter.package_name}} to ${PREFIX}/bin/{{cookiecutter.package_name}}"
