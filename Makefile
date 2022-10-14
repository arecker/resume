.phony: all
all: resume.html resume.pdf

%.pdf: %.html
	@echo "==> $*.html -> $*.pdf"
	wkhtmltopdf -q $*.html $*.pdf

pandoc_cmd := echo "" | pandoc --quiet --standalone --embed-resources --metadata title=" - " --template resume.html.tmpl
%.html: %.yml resume.html.tmpl
	@echo "==> $*.yml -> $*.html"
	$(pandoc_cmd) --metadata-file $*.yml -o $*.html

%.yml: %.jsonnet
	@echo "==> $*.jsonnet -> $*.yml"
	jsonnet -S -e 'std.manifestYamlDoc(import "$*.jsonnet")' > $*.yml

.phony: clean
clean:
	@echo "==> cleaning project"
	rm -f *.yml *.pdf *.html
