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

echo "Create directories"
mkdir -vp "${PREFIX}"/{bin,lib/shellm,share/man/man{1,3}}

echo "Install binaries"
cp -vR "${APP_ROOT}"/bin/* "${PREFIX}"/bin

echo "Install libraries"
cp -vR "${APP_ROOT}"/lib/* "${PREFIX}"/lib/shellm

echo "Install man pages"
cp -v "${APP_ROOT}"/man/*.1 "${PREFIX}"/share/man/man1
cp -v "${APP_ROOT}"/man/*.3 "${PREFIX}"/share/man/man3
