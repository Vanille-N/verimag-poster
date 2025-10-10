#import "@preview/cetz:0.4.2"
#import "@preview/cades:0.3.0": qr-code

#import "verimag.typ": palette, build-page
#import "elems.typ"


#let url-and-qr(title, url, short: auto) = {
  set text(fill: palette.blue.xdk)
  box[
    #box(baseline: 50%)[#qr-code("https://example.com", width: 8cm, color: palette.blue.xdk, background: palette.blue.mid)]
    #h(1cm)
    #box(baseline: 50%)[
      #title \
      #raw(if short == auto { url } else { short })
    ]
  ]
}

#let veri-page = build-page(
  font: (
    family: "Inria Sans",
    size: (
      base: 100pt,
      title: 140%,
      authors: 60%,
      body: 40%,
    ),
  ),
  title: [*My poster*],
  authors: (
    ([Victor], [Hugo]),
    ([Georges], [Sand]),
  ),
  footnote: url-and-qr([Our publications], "https://example.com"),
  // Format de page
  dimensions: (
    orientation: "portrait",
    footer: 9%,
    header: 12%,
    margin: 2cm,
  ),
  // Couleurs générales
  palette: (
    title: palette.red.dk,
    authors: palette.gray.lt,
    header: gradient.linear(palette.blue.dk, palette.blue.dk, palette.blue.xdk, angle: 50deg),
    footer: palette.blue.mid,
    background: palette.blue.xlt,
    border: palette.blue.xdk,
  ),
)

#let boxes = elems.make-boxes(
  // Boîtes customisables
  boxes: (
    normal: (
      style: "boxed",
      palette: (
        title: palette.brown.mid,
        body: palette.yellow.xlt,
      ),
    ),
    info: (
      style: "boxed",
      palette: (
        title: palette.green.dk,
        body: palette.green.xlt,
      )
    ),
    highlight: (
      style: "boxed",
      palette: (
        title: palette.red.dk,
        body: palette.gray.xlt,
      )
    ),
  ),
)

#show: veri-page
#show: columns.with(2)

#boxes.info.with[Definition][
  #lorem(25)
]()

#boxes.normal.with[Example][
  #lorem(50)
]()

#boxes.info.with[Definition][
  #lorem(20)
]()

#boxes.normal.with[Note][
  #lorem(160)
]()

#boxes.highlight.with[Theorem][
  Pour tout $n in NN$,
  $ sum_(i = 0)^n i = n(n-1)/2 $
]()

#boxes.normal.with[Illustration][
  #show: align.with(center)
  #cetz.canvas({
    import cetz.draw: *
    for i in range(10) {
      rect((i*2cm, 0), ((i+1)*2cm, (i+1)*2cm))
    }
  })
]()
