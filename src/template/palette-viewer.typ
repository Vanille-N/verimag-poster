#let percent_white(color) = {
  let color = rgb(color)
  int(calc.round(float(color.components(alpha: false).sum()) * 100.0 / 3))
}

#let cblock(color, label, size: 2cm) = {
  box(rect(height: size, width: size, fill: color, {
    set text(size: 17pt, fill: if percent_white(color) > 50 { black } else { white })
    show: align.with(center + horizon)
    [
      #raw(label)
      #text(size: 12pt)[#percent_white(color)%]
    ]
  }))
}

#let viewer(palette, block-size: 2cm, primary: -1) = {
  for (idx, (key, vals)) in palette.pairs().enumerate() {
    if idx == primary {
      colbreak()
    }
    [== #key]
    if type(vals) == dictionary {
      for (variant, color) in vals {
        cblock(color, variant, size: block-size)
      }
    } else {
      cblock(vals, "", size: block-size)
    }
  }
}

= Verimag

#[
  #show: columns.with(2)
  #viewer(primary: 3, block-size: 1.2cm, {
    import "verimag.typ"
    verimag.palette
  })
]