#let project(nom_dm: "", nom: "", nom_ue: "", date: "", body) = {
  set document(title: nom_dm)
  let page_counter = counter(page)
  page_counter.update(1)
  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 15mm, bottom: 15mm),
    numbering: "1/1",
    footer: context { box(stroke: (top: 1pt), inset: 5pt)[
      #h(1fr)
      #page_counter.display(
        "1/1",
        both: true
      )
    ]}
  )
  set heading(numbering: "1.a.")
  set enum(numbering: "1.a.")
  set footnote.entry(separator: line(length: 100%, stroke: 1pt), gap: 0.8em)
  show link: underline

  grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    text(nom, size: 12pt),
    text(date, size: 12pt),
    text(nom_ue, size: 12pt)
  )
  line(length: 100%, stroke: black)
  align(center)[
    #block(text(weight: 700, 15pt, nom_dm), below: 20pt, above: 25pt)
  ]
  line(length: 100%, stroke: black)

  body
}
