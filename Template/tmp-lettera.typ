/* MODELLO PER LETTERE DI CANDIDATURA
Il seguente modello può essere incorporato nelle presentazioni tramite comando: #import "tmp-lettera.typ": conf
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

#let conf(
  // Variabili di template
  data: none,
  oggetto: none,
  responsabile: none,
  body
) = {
  // Configurazione della pagina
  set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
  set text(font: font, size: 12pt, fill: txt-color)
  set par(justify: true)
  set list(marker: ([•], [◦], [-]))    // Formattazione punti elenco

  // Intestazione del gruppo
  align(left)[
    #grid(    // Logo UniPD + logo del gruppo
      columns: (auto, auto, auto),
      gutter: 0.25cm,
      align: horizon,

      image("/Assets/logo-unipd.svg", height: 1.5cm),
      line(angle: 90deg, length: 1.5cm, stroke: 0.5pt + deco-line),
      image(logo, height: 0.75cm)
    )
    #text(size: 10pt, fill: txt-gray)[
      Progetto di Ingegneria del Software \
      Università di Padova - A.A. 26 / 27 \
      
      E-mail: #link("mailto:astrum.unipd@gmail.com")[astrum.unipd\@gmail.com]
    ]
  ]

  v(0.5cm)

  // Intestazione destinatario della comunicazione
  align(right)[
    Spett.le
    #text(weight: "bold", style: "italic")[Sanmarco Informatica S.p.A.] \
    \
    Padova, #data
  ]

  v(1cm)

  text(weight: "bold")[Oggetto: #oggetto]

  v(0.5cm)
  
  body

  // Firma del responsabile
  v(0.5cm)
  text(weight: "bold", style: "italic")[#responsabile]
}