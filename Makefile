.PHONY: clean-pyc clean-build clean

help:
	@echo "clean         - remove all build artifacts"
	@echo "clean-build   - remove build artifacts"
	@echo "clean-pyc     - remove Python file artifacts"

clean: clean-build clean-pyc clean-test
	find . -name '*~' -exec rm -f {} +

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +
	find . -name '*~' -exec rm -f {} +

clean-test:
	rm -rf .tox/
	rm -f .coverage
	rm -rf htmlcov/


