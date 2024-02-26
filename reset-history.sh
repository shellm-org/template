#!/usr/bin/env bash
cd tests/tmp || exit 1
rm -rf .git
git init .
git remote add origin git@github.com:shellm-org/template-testing
git add -A
git commit -m "initial commit"
git push origin main -f
