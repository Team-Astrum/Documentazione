/* MODELLO PER DOCUMENTAZIONE DI PROGETTO
Il seguente modello può essere incorporato nelle presentazioni tramite comando: #import "../../Template/tmp-documentazione.typ": conf, usecase
Le variabili vengono istanziate all'inizio di ciascuna presentazione.
*/

// Set parametri di stile
#let font = "Inter"

#let logo = "./Assets/logo.svg"

#let deco-line = rgb("#E5E9ED")
#let txt-color = rgb("#1F2937")
#let dark-accent = rgb("#1E3A87")
#let light-accent = rgb("#2563EB")
#let txt-gray = rgb("#626973")

// Template per ciascun caso d'uso
#let usecase(id, titolo, attore, pre, post, scenario) = {
  set par(justify: false)
  table(
    columns: (30%, 70%),
    stroke: 0.5pt + deco-line,
    align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
    
    // Intestazione
    table.cell(colspan: 2)[
      #text(weight: "bold")[#id - #titolo]
    ],
    
    // Campi della tabella
    [*Attore Primario*], [#attore],
    [*Precondizioni*], [#pre],
    [*Postcondizioni*], [#post],
    [*Scenario principale*], [#scenario]
  )
}

#let conf(
  titolo: none,
  status: none,   // Valori: In bozza, Approvato
  utilizzo: none,   // Valori: Interno, Esterno
  redazione: (),
  verifica: (),
  approvazione: (),
  changelog: (),    // Array per il registro modifiche
  body
) = {
  set text(font: font, size: 12pt, fill: txt-color)
  set par(justify: true)
  set heading(numbering: "1.1. ")

  show heading: it => {
    set text(fill: dark-accent, weight: "bold")
    block(below: 0.5cm, above: 0.5cm, it)
  }

  set page(
    paper: "a4",
    numbering: "I",
    margin: (x: 2.5cm, y: 2.5cm),
    // Inserimento header (no in frontespizio)
    header: context {
      if here().page() > 1 [
        #set text(size: 10pt, fill: txt-gray)
        #grid(
          columns: (1fr, 1fr),
          align(left)[*Astrum* - Verbale #utilizzo],
          align(right)[#titolo]
        )
        #v(-0.5em)
        #line(length: 100%, stroke: 0.5pt + light-accent)
      ]
    },

    // Inserimento footer (no frontespizio)
    footer: context {
      if here().page() > 1 [
        #line(length: 100%, stroke: 0.5pt + deco-line)
        #v(-0.25em)
        #set text(size: 8pt, fill: txt-gray)
        #grid(
          columns: (1fr, 1fr, 1fr),
          align(left)[Versione: #versione],
          align(center)[Uso: #utilizzo],
          align(right)[Pagina
          #if here().page-numbering() == "I" [
              #counter(page).display("I")
            ] else [
              #counter(page).display("1 / 1", both: true)
            ]
          ]
        )
      ]
    }
  )

  // Metadati letti dal sito (non producono alcun output visibile)
  [#metadata((
    categoria: "documento",
    titolo: titolo, tipo: utilizzo,
    versione: if changelog.len() > 0 { changelog.first().ver } else { none },
    data-modifica: if changelog.len() > 0 { changelog.first().data } else { none },
    status: status
  )) <info>]

  // Decorazione per frontespizio
  let details = place(bottom + right, dx: 2cm, dy: 4cm)[
    #box(width: 0pt, height: 0pt)[
      // Archi di decorazione in background
      #place(center, circle(radius: 4cm, stroke: 0.5pt + deco-line))
      #place(center, circle(radius: 8cm, stroke: 0.5pt + deco-line))
      #place(center, circle(radius: 16cm, stroke: 0.5pt + deco-line))
      #place(center, circle(radius: 24cm, stroke: 0.5pt + deco-line))
    ]
  ]

  align(center)[
    #details
    #v(1fr)
    #text(size: 28pt, weight: "bold", fill: light-accent)[#titolo]
    #grid(    // Logo UniPD + logo del gruppo
      columns: (auto, auto, auto),
      gutter: 0.5cm,
      align: horizon,

      image("./Assets/logo-unipd.svg", height: 2cm),
      line(angle: 90deg, length: 2cm, stroke: 0.5pt + deco-line),
      image(logo, height: 1cm)
    )
    #v(1cm)
    #text(size: 14pt, style: "italic")[Progetto di Ingegneria del Software \
    Università di Padova - A.A. 26 / 27]
    
    #v(3cm)
    
    // Tabella con dati del documento
    #align(center)[
      #table(
        columns: (120pt, 200pt),
        align: (right, left),
        stroke: 0.5pt + deco-line,
        fill: white,
        
        [*Versione*], [#if changelog.len() > 0 { changelog.first().ver } else { none }],
        [*Data*], [#if changelog.len() > 0 { changelog.first().data } else { none }],
        [*Stato*], [#status],
        [*Uso*], [#utilizzo],
        [*Redazione*], [#redazione.join(", ")],
        [*Verifica*], [#verifica.join(", ")],
        [*Approvazione*], [#approvazione.join(", ")]
      )
    ]
    #v(1fr)
  ]

  pagebreak()
  counter(page).update(1)

  // Registro delle modifiche al documento
  if changelog.len() > 0 {
    heading(numbering: none, outlined: false)[Registro delle modifiche]
    table(
      columns: (150pt, 1fr),
      stroke: 0.5pt + deco-line,
      
      table.header(
        text(weight: "bold")[Versione],
        text(weight: "bold")[Descrizione]
      ),
      
      ..changelog.map(entry => (
        [
          *v#entry.ver* \
          #text(size: 10pt, fill: txt-gray)[
            #entry.data \
            #entry.autore (#entry.ruolo)
          ]
        ],
        entry.desc
      )).flatten()    // Array unidimensionale
    )
    
    pagebreak()
  }

  // Indice
  heading(numbering: none, outlined: false)[Indice]
  set outline.entry(fill: repeat(text(fill: deco-line)[ . ]))
  outline(title: none, indent: auto)    // Rimozione di titolo preimpostato
  pagebreak()

  set page(numbering: "1 / 1")
  counter(page).update(1)   // Reset del conteggio
  
  body
}