#let pro = $\u{221D}$
#let al = [$chevron.l$]
#let ar = [$chevron.r$]
#let ps(x, y) = [$lr(al #x|#y ar)$]
#let Ker(x) = [$"Ker"(#x)$]
#let Vect(x) = [$"Vect"(#x)$]
#let Id = [$"Id"$]


#let todo = box(fill: rgb("#ffff00"), inset:0.3em)[TODO]

#let div(nom, bg, border, body) = {
  block(
    width: 100%,
    fill: bg,
    stroke: 0.5pt + border,
    inset: 8pt,
    radius: 1.5pt,
    [*#nom:*\ #body]
  )
}

#let def(nom, body) = {
  div([Définition #nom], rgb("#fef9f3"), rgb("#774315"), body)
}

#let rem(nom, body) = {
  div([Remarque #nom], none, rgb("#c00000"), body)
  // [*Remarque #nom*\ #body]
}

#let exemple(nom, body) = {
  div([Exemple #nom], none, white, body)
  // [*Exemple #nom*\ #body]
}

#let exercice(nom, body) = {
  div([Exercice #nom], none, white, body)
  // [*Exercice #nom*\ #body]
}

#let th(nom, body) = {
  div([Théorème #nom], rgb("#f5fff3"), rgb("#245815"), body)
}

#let cor(nom, body) = {
  div([Corollaire #nom], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let csq(nom, body) = {
  div([Conséquence #nom], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let propriete(nom, body) = {
  div([Propriété #nom], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let prop(nom, body) = {
  div([Proposition #nom], white, rgb("#0000f5"), body)
}

#let lemme(nom, body) = {
  div([Lemme #nom], white, rgb("#00a0d5"), body)
}

#let preuve(nom, body) = {
  div([Preuve #nom], rgb("#f1f1f1"), black, body)
  // [*Preuve #nom*\ #body]
}

#let notation(nom, body) = {
  div([Notation #nom], rgb("#fffae5"), rgb("#877416"), body)
}

#let project(chapitre: "", description: [], ancien_nom_ue: "", nom_ue: "", date: "", body) = {
  set document(title: chapitre)
  set page(
    paper: "a4",
    margin: (left: 20mm, right: 20mm, top: 10mm, bottom: 20mm),
  )
  set enum(numbering: "1.a)")
  show link: underline
  show link: set text(blue)

  set text(
    font: "New Computer Modern",
    lang: "fr",
    size: 10pt,
    ligatures: true
  )

  set heading(numbering: "1.")

  // Information UE
  align(center)[
    #text(
      nom_ue,
      size: 15pt,
      fill: gray,
      weight: "bold"
    )
  ]
  text(
    ancien_nom_ue,
    size: 10pt,
    weight: "bold"
  )
  h(1fr)
  text(
    date,
    size: 10pt,
  )

  line(length: 100%, stroke: gray)

  // Description
  align(center)[
    #block(text(weight: 700, 1.75em, chapitre), below: 20pt, above: 20pt)
  ]
  set par(justify: true)
  description

  line(length: 100%, stroke: gray)

  // Table des matières
  set text(font: "New Computer Modern", lang: "fr", size: 10pt)
  outline(indent: 2em)
  let page_counter = counter(page)
  page_counter.update(0)

  // Cours
  set page(
    numbering: "1/1",
    footer: context { box(stroke: (top: 1pt), inset: 5pt)[
      #h(1fr)
      #page_counter.display(
        "1/1",
        both: true
      )
    ] },
    footer-descent: 20%,
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 15mm),
  )

  body
}
