#let make-box-with-boxed-title(title, body, width: 100%, palette: (:)) = {
  import "@preview/showybox:2.0.4": showybox
  showybox(
    width: width,
    frame: (
      radius: (top-right: 2cm),
      border-color: palette.title,
      thickness: 5pt,
      title-color: palette.title,
      body-color: palette.body,
      title-inset: (x: 2cm, y: 6mm)
    ),
    title-style: (
      boxed-style: (
        radius: (top-right: 2cm),
      ),
    ),
    above: 1cm,
    below: 1cm,
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
