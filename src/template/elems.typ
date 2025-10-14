#let make-box-with-boxed-title(title, body, width: 100%, palette: (:), title-align: (:)) = {
  import "@preview/showybox:2.0.4": showybox
  showybox(
    width: width,
    frame: (
      radius: (top-right: 2cm),
      border-color: palette.title,
      thickness: 5pt,
      title-color: palette.title,
      body-color: palette.body,
      title-inset: (x: 3cm, y: 5mm),
    ),
    above: 1cm,
    below: 1cm,
    title-style: (
      boxed-style: (
        anchor: title-align,
        radius: (top-right: 2cm),
      ),
    ),
    shadow: (offset: 3pt),
    title: title,
    body,
  )
}

#let make-box(style: "unimpl", ..params) = {
  let fun = (
    "boxed": make-box-with-boxed-title,
  ).at(style)
  fun(..params)
}

#let make-boxes(..args) = {
  let boxes = {
    (:)
    for (key, params) in args.named().boxes {
      ("" + key: (title, body, ..extra) => {
        make-box(title, body, ..params)
      })
    }
  }
  boxes
}
