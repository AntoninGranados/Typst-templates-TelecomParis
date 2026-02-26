#let div(nom, bg, border, body) = {
  block(
    width: 100%,
    fill: bg,
    stroke: border,
    above: 0.2em,
    below: 0.2em,
    inset: 5pt,
    radius: 4pt,
    [*#nom*: #body]
  )
}

#let project(nom_tp: "", nom_ue: "", date: "", groupe: "", body) = {
  set document(title: nom_tp)
  set page(
    paper: "a4",
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
  )
  set text(font: "New Computer Modern", lang: "fr", size: 10pt, spacing: 80%)
  set par(leading: 0.4em)
  show link: underline
  show link: set text(blue)

  align(center)[
    #block(text(weight: 700, 1.75em, nom_tp), below: 20pt, above: 20pt)
  ]

  text(
    groupe,
    fill: gray,
    size: 10pt,
    weight: "bold"
  )
  h(1fr)
  text(
    nom_ue,
    fill: gray,
    size: 10pt,
    weight: "bold"
  )
  h(1fr)
  text(
    date,
    fill: gray,
    size: 10pt,
    weight: "bold"
  )

  line(length: 100%, stroke: gray)

  body
}
