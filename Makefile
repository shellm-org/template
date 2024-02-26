.PHONY: $(MAKECMDGOALS)

clean:
	@rm -rf tests/tmp

cleantests:
	@rm -rf tests/tmp/.git
	@rm -rf tests/tmp/empty
	@rm -f tests/tmp/CHANGELOG.md

docs:
	@mkdocs serve

docs-deploy:
	@mkdocs gh-deploy

format:
	@ruff format

gen generate:
	@bash -c 'source tests/helpers.sh && generate ${PWD} tests/tmp'

reset-history: gen
	@./reset-history.sh

test: cleantests
	@./runtests.sh

changelog:
	@git-changelog -Tio CHANGELOG.md -Bauto -c angular

release:
	@test -n "$(version)" || { echo "error: usage: make release version=x.y.z" >&2; exit 1; }
	@git add CHANGELOG.md
	@git commit -m "docs: Update changelog for version $(version)"
	@git tag "$(version)"
	@git push
	@git push --tags

DUTIES = \
	test-changelog \
	test-check \
	test-check-api \
	test-check-docs \
	test-check-quality \
	test-clean \
	test-coverage \
	test-docs \
	test-docs-deploy \
	test-format \
	test-help \
	test-release \
	test-setup \
	test-test

$(DUTIES):
	@cd tests/tmp && make $(subst test-,,$@)
