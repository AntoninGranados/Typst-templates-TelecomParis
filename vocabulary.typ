#let vocab_list = state("vocab", ())
#let vocab_to_remove = state("vocab_to_remove", ())

#let add_to_remove(reg) = context {
  vocab_to_remove.update(v => (if v == none {()} else {v}) + (reg,))
}

#let clean_id(w) = {
  let id = upper(w)

  let to_remove = if vocab_to_remove.get() == none {()} else {vocab_to_remove.get()}
  for reg in to_remove {
    id = id.replace(reg, "")
  }

  id = id.replace("À","A").replace("Â","A").replace("Ä","A")
  id = id.replace("É","E").replace("È","E").replace("Ê","E").replace("Ë","E")
  id = id.replace("Î","I").replace("Ï","I")
  id = id.replace("Ô","O").replace("Ö","O")
  id = id.replace("Ù","U").replace("Û","U").replace("Ü","U")
  id = id.replace("Ç","C")

  id
}

#let vocab(lang_a, lang_b) = context {
  let clean_lang_a = lower(lang_a)
  let clean_lang_b = lower(lang_b)
  vocab_list.update(v => (if v == none {()} else {v}) + ((clean_lang_a, clean_lang_b),))
  [#lang_a: #emph[#lang_b]]
}

#let display_vocab() = context {
  let v = if vocab_list.get() == none {()} else {vocab_list.get()}
  let items = v.dedup().sorted(key: x => clean_id(x.at(0)))

  let current = none

  for x in items {
    let lang_a = x.at(0)
    let lang_b = x.at(1)
    let letter = clean_id(lang_a).slice(0, 1)

    if current == none or letter != current {
      current = letter
      [== #letter]
    }

    [- #lang_a: #emph[#lang_b]]
  }
}
