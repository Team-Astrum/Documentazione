/* MODELLO PER PRESENTAZIONI "DIARIO DI BORDO"
Il seguente modello può essere incorporato nelle presentazioni tramite comando: #import "tmp-slides.typ": conf, slide-title
Le variabili vengono istanziate all'inizio di ciascuna presentazione.
*/

// Set parametri di stile
#let font = "Inter"

#let logo = "/Assets/logo.svg"

#let deco-line = rgb("#E5E9ED")
#let txt-color = rgb("#1F2937")
#let dark-accent = rgb("#1E3A87")
#let light-accent = rgb("#2563EB")
#let txt-gray = rgb("#626973")

// Titolo per le slide generiche
#let slide-title(title) = {
  text(size: 28pt, weight: "bold", fill: dark-accent)[#title]
  v(0.25em)
}

#let conf(
  // Variabili di template
  settimana: none,
  data: none,
  espositore: none,
  body
) = {
  // Decorazione per frontespizio
  let details = place(bottom + right, dy: 4cm)[
    #box(width: 0pt, height: 0pt)[
      // Archi di decorazione in background
      #place(center, circle(radius: 4cm, stroke: 0.5pt + deco-line))
      #place(center, circle(radius: 8cm, stroke: 0.5pt + deco-line))
      #place(center, circle(radius: 16cm, stroke: 0.5pt + deco-line))
      #place(center, circle(radius: 24cm, stroke: 0.5pt + deco-line))
    ]
  ]

  // Configurazione pagine generiche slide
  set page(
    paper: "presentation-16-9",   // Formato
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),   // Margini
    
    // Inserimento decorazione solo nella frontespizio
    background: context {
      if here().page() == 1 { details }
    },
    
    // Inserimento header (no in frontespizio)
    header: context {
      if here().page() > 1 [
        #set text(font: font, size: 12pt, fill: txt-gray)
        #grid(
          columns: (1fr, 1fr),    // Divisione a 2 colonne
          align(left)[*Astrum* - Diario di Bordo],
          align(right)[Settimana #settimana]
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
        #set text(font: font, size: 10pt, fill: txt-gray)
        #grid(
          columns: (1fr, 1fr),
          align(left)[Espone: *#espositore* (Responsabile)],
          align(right)[Pagina #counter(page).display("1 / 1", both: true)]    // Contatore pagine
        )
      ]
    }
  )
  
  set text(font: font, size: 18pt, fill: txt-color)    // Testo per tutte le slide
  set list(marker: ([•], [◦], [-]))    // Formattazione punti elenco
  
  // Frontespizio
  align(center + horizon)[
    #text(size: 34pt, weight: "bold", fill: light-accent)[Diario di Bordo]
    #grid(    // Logo UniPD + logo del gruppo
      columns: (auto, auto, auto),
      gutter: 1cm,
      align: horizon,

      image("/Assets/logo-unipd.svg", height: 3cm),
      line(angle: 90deg, length: 3cm, stroke: 0.5pt + deco-line),
      image(logo, height: 1.5cm)
    )
    #v(2em)
    #text(size: 18pt, fill: txt-gray)[
      *Settimana:* #settimana \
      *Data:* #data \
      *Espone:* #espositore (Responsabile)
    ]
  ]

  pagebreak()
  counter(page).update(1)
  body
}