
JADE = ./node_modules/.bin/jade

HTML = index.html \
	bicycle.html \
	graph-rdf.html
#	api.html \
#	applications.html \
#	community.html \
#	faq.html

docs: $(HTML)

%.html: %.jade
	$(JADE) -P --path $< < $< > $@

clean:
	rm -f *.html

watch:
	$(JADE) -w *.jade
	
publish:
	rsync -avu --exclude 'node_modules' --delete -e ssh . evaleto@evaletolab.ch:www/evaletolab.ch/

.PHONY: docs clean publish
