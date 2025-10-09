typstc cmd file fmt:
  mkdir -p build
  typst {{cmd}} --font-path=fonts --root=. src/{{file}}.typ build/{{file}}.{{fmt}}

build: (typstc "compile" "poster" "pdf")
watch: (typstc "watch" "poster" "pdf")
palette: (typstc "watch" "palettes" "pdf")

