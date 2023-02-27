# define targets
.PHONY: init test build install format lint check-lint
PYTHON = python3.11

init:
	./setup.sh

test:
	coverage run -m pytest test --junitxml=report.xml

build:
	find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
	$(PYTHON) -m build

install:
	pip install --editable .
	pip install '.[dev]'
	pip install '.[test]'

format:
	black --verbose src test/
	isort .

check-lint:
	ruff .

lint:
	ruff --fix .