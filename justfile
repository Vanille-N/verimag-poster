typstc cmd file fmt:
  mkdir -p build
  typst {{cmd}} --font-path=fonts --root=. src/{{file}}.typ build/{{file}}.{{fmt}}

build: (typstc "compile" "poster" "pdf")
cover: (typstc "compile" "poster" "png")
watch: (typstc "watch" "poster" "pdf")
palette: (typstc "watch" "palettes" "pdf")

tar:
  mkdir -p verimag-poster
  rm -rf verimag-poster/*
  cp -r assets build fonts verimag-poster/
  cp -r justfile Makefile README.md verimag-poster/
  cp -r src verimag-poster/
  tar czf verimag-poster.tar.gz verimag-poster

fetch:
  git fetch github
  git fetch gricad

push:
  git push github
  git push gricad
