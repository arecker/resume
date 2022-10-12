.phony: all
all: resume.pdf

resume.html: venv/bin/python resume.json resume.py resume.html.j2 resume.css avatar.jpg
	@echo "==> resume.json -> $@"
	./resume.py > $@

seed_python := $(shell which python)
venv/bin/python:
	@echo "==> python -> $@"
	$(seed_python) -m venv ./venv
	./venv/bin/pip install -q --upgrade pip
	./venv/bin/pip install -q --upgrade Jinja2

%.json: %.jsonnet
	@echo "==> $*.jsonnet -> $*.json"
	jsonnet $*.jsonnet > $*.json

%.pdf: %.html
	@echo "==> $*.html -> $*.pdf"
	wkhtmltopdf -q $*.html $*.pdf

.phony: clean
clean:
	@echo "==> cleaning project"
	rm -f *.json
	rm -f *.pdf
	rm -f *.html
	rm -rf ./venv
