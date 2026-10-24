# Makefile for Hugo

HUGO = hugo
HUGO_FLAGS =
PUBLIC_DIR = public
REPO = git@github.com:yeasin50/blog.git

.PHONY: help serve build clean publish

help:
	@echo "Makefile for Hugo"
	@echo
	@echo "Usage:"
	@echo "  make serve     Start Hugo development server"
	@echo "  make build     Build the site into ./$(PUBLIC_DIR)"
	@echo "  make clean     Remove generated site"

serve:
	$(HUGO) server -D -b http://localhost:1313/ -p 1313 $(HUGO_FLAGS) --disableFastRender --noHTTPCache --buildFuture

build:
	$(HUGO) $(HUGO_FLAGS)

clean:
	rm -rf $(PUBLIC_DIR)

publish: build
	cd $(PUBLIC_DIR) && \
	git init && \
	git checkout -B gh-pages && \
	git add -A && \
	git commit -m "Publish site" && \
	git push -f $(REPO) gh-pages
