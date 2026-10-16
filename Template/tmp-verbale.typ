/* MODELLO PER VERBALI DI RIUNIONE
Il seguente modello può essere incorporato nelle presentazioni tramite comando: #import "tmp-verbale.typ": conf, decisioni
Le variabili vengono istanziate all'inizio di ciascuna presentazione.
*/

// Set parametri di stile
#let font = "Inter"

#let logo = "/Assets/logo.svg"
#let logo-ridotto = "/Assets/logo-ridotto.svg"

#let deco-line = rgb("#E5E9ED")
#let txt-color = rgb("#1F2937")
#let dark-accent = rgb("#1E3A87")
#let light-accent = rgb("#2563EB")
#let txt-gray = rgb("#626973")

// Helper per le decisioni prese nel corso del meeting
#let decisioni(..items) = {
  table(
    columns: (15%, 85%),
    stroke: 0.5pt + deco-line,
    table.header(
      text(weight: "bold")[ID],
      text(weight: "bold")[Decisione]
    ),
    ..items
  )
}

#let conf(
  tipo: none,
  data: none,
  ora-inizio: none,
  ora-fine: none,
  luogo: none,
  azienda: none,
  presenti: (),
  assenti: (),
  responsabile: none,
  redattore: none,
  verificatore: none,
  changelog: (),    // Array per il registro modifiche
  body
) = {
  set text(font: ("Inter"), size: 12pt, txt-color)
  set par(justify: true)
  set heading(numbering: "1. ")

  show heading: it => {
    set text(fill: dark-accent, weight: "bold")
    block(below: 0.5cm, above: 0.5cm, it)
  }

  set list(marker: ([•], [◦], [-]))    // Formattazione punti elenco

  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    // Inserimento header
    header: context {
      if here().page() > 1 [
        #set text(size: 10pt, fill: txt-gray)
        #grid(
          columns: (1fr, 1fr),
          align(left)[*Astrum* - Verbale #tipo],
          align(right)[#data]
        )
        #v(-0.5em)
        #line(length: 100%, stroke: 0.5pt + light-accent)
      ]
    },

    // Inserimento footer
    footer: context {
      if here().page() > 1 [
        #line(length: 100%, stroke: 0.5pt + deco-line)
        #v(-0.25em)
        #set text(size: 8pt, fill: txt-gray)
        #grid(
          columns: (1fr, 1fr, 1fr),
          align(left)[Redazione: #redattore],
          align(center)[Verifica: #verificatore],
          align(right)[Pagina #counter(page).display("1 / 1", both: true)]
        )
      ]
    }
  )

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
    #text(size: 28pt, weight: "bold", fill: light-accent)[Verbale #tipo]
    #grid(    // Logo UniPD + logo del gruppo
      columns: (auto, auto, auto),
      gutter: 0.5cm,
      align: horizon,

      image("/Assets/logo-unipd.svg", height: 2cm),
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
        columns: (25%, 75%),
        align: (right, left),
        stroke: white,
        
        [*Data e ora:*], [#data, #ora-inizio - #ora-fine],
        [*Luogo / Canale:*], [#luogo],
        // Solo se verbale di tipo esterno con azienda mentore
        ..(if azienda != none { ([*Azienda:*], [#azienda]) } else { () }),
        [*Partecipanti:*], [#presenti.join(", ")],
        [*Assenti:*], [
          // Se presenti assenti
          #(if assenti.len() == 0 { "" } else { assenti.join(", ") })
        ],
        [*Responsabile:*], [#responsabile]
      )
    ]

    #v(1fr)
    #pagebreak()
  ]

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

  body
}