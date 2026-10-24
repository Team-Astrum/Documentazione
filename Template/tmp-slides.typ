/* MODELLO PER PRESENTAZIONI "DIARIO DI BORDO"
Il seguente modello può essere incorporato nelle presentazioni tramite comando: #import "../../Template/tmp-slides.typ": conf, slide-title
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

// Titolo per le slide generiche
#let slide-title(title) = {
  text(size: 28pt, weight: "bold", fill: dark-accent)[#title]
  v(0.25em)
}

#let conf(
  // Variabili di template
  sprint: none,
  data: none,
  membri: (),
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

  // Elenco dei membri per pagina finale
  let membro(membro, matricola, figura) = {
    text(size: 18pt, weight: "bold", fill: txt-color)[#membro]
    linebreak()
    text(size: 12pt, fill: txt-gray)[#matricola]
    linebreak()

    if lower(figura) == "responsabile" {
      text(size: 14pt, fill: light-accent)[#figura]
    } else {
      text(size: 14pt, fill: dark-accent)[#figura]
    }
  }

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
          align(right)[Sprint #sprint]
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
          align(left)[#link("mailto:astrum.unipd@gmail.com")],
          align(right)[Pagina #counter(page).display((cur, total) => [#cur / #(total - 1)], both: true)]    // Contatore pagine
        )
      ]
    }
  )
  
  set text(font: font, size: 18pt, fill: txt-color)    // Testo per tutte le slide
  set list(marker: ([•], [◦], [-]))    // Formattazione punti elenco
  
  // Frontespizio
  align(center + horizon)[
    #text(size: 40pt, weight: "bold", fill: light-accent)[Diario di Bordo]
    #grid(    // Logo UniPD + logo del gruppo
      columns: (auto, auto, auto),
      gutter: 1cm,
      align: horizon,

      image("./Assets/logo-unipd.svg", height: 3cm),
      line(angle: 90deg, length: 3cm, stroke: 0.5pt + deco-line),
      image(logo, height: 1.5cm)
    )
    #v(2em)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 18pt, fill: txt-gray)[
        *Sprint:* #sprint \
        *Data:* #data \
      ],

      text(size: 18pt, fill: txt-gray)[
        *E-mail:* #link("mailto:astrum.unipd@gmail.com") \
        *Sito web:* #link("team-astrum.github.io")
      ]
    )
  ]

  pagebreak()
  counter(page).update(1)
  body

  set page(
    header: none,
    footer: none,
    background: context { details }
  )

  align(center + horizon)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),

      membro("Corrado Bacco", "2148615", membri.at("Corrado Bacco")),
      membro("Gianluca Bacco", "2111937", membri.at("Gianluca Bacco")),
      membro("Gianluca Brotto", "2148626", membri.at("Gianluca Brotto")),
      membro("Matteo De Col", "2148619", membri.at("Matteo De Col")),
    )
    
    #v(3em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      
      membro("Filippo De Guio", "2113177", membri.at("Filippo De Guio")),
      membro("Samuele Gobbi", "2148004", membri.at("Samuele Gobbi")),
      membro("Thomas Morettin", "2111001", membri.at("Thomas Morettin")),
    )
  ]
}