PROJECT_NAME = aiohttp_example

.PHONY: clean
clean:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

.PHONY: activate
activate:
	conda activate $(PROJECT_NAME)

.PHONY: create
create:
	conda env create -f environment.yml

.PHONY: update
update:
	pip-compile requirements.in --output-file requirements.txt
	pip-compile dev-requirements.in --output-file dev-requirements.txt

.PHONY: update_env_yml
update_env_yml:
	conda env export --from-history -f environment.yml

.PHONY: update_env
update_env:
	conda env update --file environment.yml

.PHONY: delete_env
delete_env:
	conda env remove -n $(PROJECT_NAME)

.PHONY: test
test:
	pytest tests/*
