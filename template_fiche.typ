#let div(nom-fr, nom-en, bg, border, body) = {
  block(
    width: 100%,
    fill: bg,
    stroke: border,
    above: 0.5em,
    below: 0.5em,
    inset: 0.5em,
    radius: 2pt,
  )[#context{
      let lang = text.lang
      if lang == "en" {
        [*#nom-en*]
      } else {
        [*#nom-fr*]
      }
    }
    : #body
  ]
}

#let def(nom, body) = {
  div([Définition #nom], [Definition #nom], rgb("#fef9f3"), rgb("#774315"), body)
}

#let th(nom, body) = {
  div([Théorème #nom], [Theorem #nom], rgb("#f5fff3"), rgb("#245815"), body)
}

#let cor(nom, body) = {
  div([Corollaire #nom], [Corollary #nom], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let prop(nom, body) = {
  div([Proposition #nom], [Proposition #nom], white, rgb("#0000f5"), body)
}

#let property(nom, body) = {
  div([Propriété #nom], [Property #nom], white, rgb("#0000f5"), body)
}

#let law(nom, body) = {
  div([Loi #nom], [Law #nom], white, rgb("#00a0d5"), body)
}

#let lemma(nom, body) = {
  div([Lemme #nom], [Lemma #nom], white, rgb("#00a0d5"), body)
}

#let example(nom, body) = {
  div([Exemple #nom], [Example #nom], white, purple, body)
}

#let project(chapitre: "", nom_ue: "", body) = {
  set document(title: chapitre)
  set page(
    paper: "a4",
    flipped: true,
    columns: 3,
    margin: (left: 6mm, right: 6mm, top: 6mm, bottom: 6mm),
  )
  set columns(gutter: 0.5em)
  set enum(numbering: "1.a)")
  set text(font: "New Computer Modern", lang: "fr", size: 9pt, spacing: 100%)
  set heading(numbering: "1.")
  set par(leading: 0.5em, justify: true)
  show link: underline

  align(center, text(
    [Antonin GRANADOS],
    size: 10pt,
    weight: "bold"
  ))

  text(
    nom_ue,
    fill: gray,
    size: 10pt,
    weight: "bold"
  )
  h(1fr)
  text(
    chapitre,
    fill: gray,
    size: 10pt,
    weight: "bold"
  )

  line(length: 100%, stroke: gray)

  body
}
