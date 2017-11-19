#!/usr/bin/env bash
set -e

PREFIX="${1:-/usr/local}"
APP_ROOT="$(dirname "$(readlink -f "$0")")"

echo "Create directories"
mkdir -vp "${PREFIX}"/{bin,completions/{bash,zsh},lib/shellm,man/man{1,3}}

echo "Install binaries"
cp -vR "${APP_ROOT}"/bin/* "${PREFIX}"/bin

echo "Install libraries"
cp -vR "${APP_ROOT}"/lib/* "${PREFIX}"/lib/shellm

echo "Install man pages"
cp -v "${APP_ROOT}"/man/*.1 "${PREFIX}"/man/man1
cp -v "${APP_ROOT}"/man/*.3 "${PREFIX}"/man/man3

echo "Install completions"
cp -vR "${APP_ROOT}"/cmp/*.bash "${PREFIX}"/completions/bash
cp -vR "${APP_ROOT}"/cmp/*.zsh "${PREFIX}"/completions/zsh
