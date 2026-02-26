#let pro = $\u{221D}$
#let al = [$chevron.l$]
#let ar = [$chevron.r$]
#let ps(x, y) = [$lr(al #x|#y ar)$]
#let Ker(x) = [$"Ker"(#x)$]
#let Vect(x) = [$"Vect"(#x)$]
#let Id = [$"Id"$]


#let todo = box(fill: rgb("#ffff00"), inset:0.3em)[TODO]

#let div(name, bg, border, body) = {
  block(
    width: 100%,
    fill: bg,
    stroke: 0.5pt + border,
    inset: 8pt,
    radius: 1.5pt,
    [*#name:*\ #body]
  )
}

#let def(name, body) = {
  div([Definition #name], rgb("#fef9f3"), rgb("#774315"), body)
}

#let rem(name, body) = {
  div([Remark #name], none, rgb("#c00000"), body)
  // [*Remark #name*\ #body]
}

#let example(name, body) = {
  div([Example #name], none, white, body)
  // [*Example #name*\ #body]
}

#let exercise(name, body) = {
  div([Exercise #name], none, white, body)
  // [*Exercise #name*\ #body]
}

#let th(name, body) = {
  div([Theorem #name], rgb("#f5fff3"), rgb("#245815"), body)
}

#let cor(name, body) = {
  div([Corollary #name], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let csq(name, body) = {
  div([Consequence #name], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let propriete(name, body) = {
  div([Property #name], rgb("#f2f2fe"), rgb("#000055"), body)
}

#let prop(name, body) = {
  div([Proposition #name], white, rgb("#0000f5"), body)
}

#let lemme(name, body) = {
  div([Lemma #name], white, rgb("#00a0d5"), body)
}

#let preuve(name, body) = {
  div([Proof #name], rgb("#f1f1f1"), black, body)
  // [*Proof #name*\ #body]
}

#let notation(name, body) = {
  div([Notation #name], rgb("#fffae5"), rgb("#877416"), body)
}

// English aliases
#let definition = def
#let remark = rem
#let theorem = th
#let corollary = cor
#let consequence = csq
#let property = propriete
#let proposition = prop
#let lemma = lemme
#let proof = preuve

// Backward-compatible French aliases
#let exemple = example
#let exercice = exercise

#let project(
  chapter: "",
  description: [],
  old_course_name: "",
  course_name: "",
  date: "",
  // Backward-compatible aliases.
  chapitre: "",
  ancien_nom_ue: "",
  nom_ue: "",
  body
) = {
  let final_chapter = if chapter != "" { chapter } else { chapitre }
  let final_old_course_name = if old_course_name != "" { old_course_name } else { ancien_nom_ue }
  let final_course_name = if course_name != "" { course_name } else { nom_ue }

  set document(title: final_chapter)
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

  // Course information
  align(center)[
    #text(
      final_course_name,
      size: 15pt,
      fill: gray,
      weight: "bold"
    )
  ]
  text(
    final_old_course_name,
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
    #block(text(weight: 700, 1.75em, final_chapter), below: 20pt, above: 20pt)
  ]
  set par(justify: true)
  description

  line(length: 100%, stroke: gray)

  // Table of Contents
  set text(font: "New Computer Modern", lang: "fr", size: 10pt)
  outline(indent: 2em)
  let page_counter = counter(page)
  page_counter.update(0)

  // Course content
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
