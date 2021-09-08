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
	conda activate aiohttp_example

.PHONY: create_venv
create_venv:
	conda env create -f environment.yml

.PHONY: init_yml
init_yml:
	conda env export --from-history -f environment.yml

.PHONY: update_venv
update_venv:
	conda env update --file environment.yml

.PHONY: delete_venv
delete_venv:
	conda env remove -n $(PROJECT_NAME)


.PHONY: test
test:
	pytest tests/*


.PHONY: install
install:
	pip install -r dev-requirements.txt

.PHONY: update
update: rm_txt update_txt sync

.PHONY: update_txt
update_txt:
	pip-compile requirements.in --output-file requirements.txt
	pip-compile dev-requirements.in --output-file dev-requirements.txt

.PHONY: rm_txt
rm_txt:
	rm -rf requirements.txt dev-requirements.txt

.PHONY: sync
sync:
	pip-sync dev-requirements.txt

