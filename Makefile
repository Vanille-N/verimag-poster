TYP-ARGS=--font-path=fonts --root=.

default: build/poster.pdf

build:
	typst compile $(TYP-ARGS) src/poster.typ build/poster.pdf

watch:
	typst watch $(TYP-ARGS) src/poster.typ build/poster.pdf

palettes:
	typst watch $(TYP-ARGS) src/palettes.typ build/palettes.pdf	

.PHONY: default build watch palettes
