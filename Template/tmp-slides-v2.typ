// ============================================================
//  Template Diario di Bordo – Astrum
//
//  Uso in un altro file:
//    #import "template-diario-di-bordo.typ": *
//    #show: diario.with(numero: "2", data: 2026-11-03")
//    = Attività completate
//    - ...
//
//  Il template crea da solo copertina, intestazione, piè di pagina
//  e l'ultima slide con i nomi del gruppo.
//  Compilato da solo mostra una bozza con i segnaposto.
//
//  Servono nella stessa cartella: astrum-logo-esteso.jpg e logo-unipd.svg
//  Font consigliato: Inter (se manca, viene usato un font di riserva).
// ============================================================

// ---------- Dati del gruppo (uguali per tutti i diari) ----------
#let gruppo = "Astrum"
#let email = "astrum.unipd@gmail.com"
#let logo = "astrum-logo-esteso.jpg"   // logo Astrum con scritta
#let logo-unipd = "Assets/logo-unipd.svg"     // logo Università di Padova
#let nomi = (
  "Corrado Bacco",
  "Gianluca Bacco",
  "Gianluca Brotto",
  "Matteo De Col",
  "Filippo De Guio",
  "Samuele Gobbi",
  "Thomas Morettin",
)

// ---------- Colori ----------
#let sfondo = rgb("#F9FAFC")   // stesso colore di sfondo del logo
#let navy = rgb("#1E3A8A")
#let azzurro = rgb("#2563EB")
#let testo = rgb("#0F172A")
#let grigio = rgb("#64748B")
#let bordo = rgb("#DBEAFE")

// ---------- Ultima slide: i nomi del gruppo ----------
#let slide-team() = [
  = #gruppo

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 16pt,
    ..nomi.map(n => block(
      width: 100%,
      fill: white,
      stroke: 1pt + bordo,
      radius: 8pt,
      inset: 20pt,
      text(20pt, weight: "bold", fill: navy)[#n],
    )),
  )

  #v(22pt)

  #grid(
    columns: (auto, auto),
    gutter: 12pt,
    align: horizon,
    rect(width: 4pt, height: 28pt, fill: azzurro),
    text(20pt, weight: "bold", fill: azzurro)[#email],
  )
]

// ---------- Template principale ----------
#let diario(
  numero: "N",
  data: "AAAA-MM-GG",
  titolo: "Diario di Bordo",
  body,
) = {
  let intestazione = titolo + " " + numero

  // Pagina 16:9 (960 x 540 pt), uguale per tutte le slide
  set page(
    width: 960pt,
    height: 540pt,
    margin: (x: 64pt, top: 70pt, bottom: 64pt),
    fill: sfondo,
    // Intestazione e piè di pagina: su tutte le slide tranne la copertina
    background: context {
      if here().page() > 1 {
        place(top + right, dx: -64pt, dy: 26pt, text(12pt, fill: grigio)[#intestazione])
        place(top + left, dx: 64pt, dy: 49pt, line(length: 832pt, stroke: 2pt + navy))
        place(bottom + left, dx: 64pt, dy: -34pt, text(12pt, fill: grigio)[#gruppo, #data])
        place(bottom + right, dx: -64pt, dy: -34pt, text(12pt, fill: grigio)[#counter(page).display()])
      }
    },
  )

  set text(font: ("Inter", "Liberation Sans", "Arial"), size: 22pt, fill: testo, lang: "it")

  // Ogni "= Titolo" apre una nuova slide
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(below: 40pt, text(40pt, weight: "bold", fill: navy)[#it.body])
  }

  set list(marker: [•], body-indent: 12pt, spacing: 14pt)
  set par(leading: 0.55em)

  // Copertina
  align(horizon, grid(
    columns: (150pt, auto, 1fr),
    gutter: 44pt,
    align: horizon,
    image(logo-unipd, width: 150pt),
    line(angle: 90deg, length: 250pt, stroke: 2pt + rgb("#BFDBFE")),
    stack(
      spacing: 16pt,
      image("Assets/logo.jpg", width: 520pt),
      rect(width: 120pt, height: 5pt, fill: azzurro),
      text(52pt, weight: "bold", fill: navy)[#titolo],
      text(24pt, fill: grigio)[#data],
      text(22pt, weight: "bold", fill: azzurro)[#email],
    ),
  ))

  // Slide scritte dall'utente
  body

  // Ultima slide con i nomi
  slide-team()
}

// ============================================================
//  Bozza con segnaposto (si vede solo compilando questo file;
//  quando viene importato questa parte viene ignorata)
// ============================================================
#show: diario.with(numero: "N", data: "GG-MM-AAAA")

= Attività completate

- Attività completata 1
- Attività completata 2
- Attività completata 3

= Attività da completare

- Attività da completare 1
- Attività da completare 2
- Attività da completare 3

= Difficoltà incontrate e dubbi

- Difficoltà incontrata 1
- Difficoltà incontrata 2
