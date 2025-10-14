typstc cmd file tgt fmt:
  mkdir -p build
  typst {{cmd}} --font-path=fonts --root=. src/{{file}}.typ build/{{tgt}}.{{fmt}}

build: (typstc "compile" "poster" "poster" "pdf")
cover: (typstc "compile" "poster" "cover" "png")
watch: (typstc "watch" "poster" "poster" "pdf")
palette: (typstc "watch" "template/palette-viewer" "palettes" "pdf")

ARCHIVE := "typst-verimag-poster"

tar:
  mkdir -p {{ARCHIVE}}
  rm -rf {{ARCHIVE}}/*
  cp -r assets build fonts {{ARCHIVE}}/
  cp -r justfile Makefile README.md {{ARCHIVE}}/
  cp -r src {{ARCHIVE}}/
  tar czf {{ARCHIVE}}.tar.gz {{ARCHIVE}}

fetch:
  git fetch github
  git fetch gricad

push:
  git push github
  git push gricad
