#import "../../Template/tmp-slides.typ": conf, slide-title

#show: conf.with(
  sprint: 0,
  data: "2026-10-26",
  membri: (
    "Corrado Bacco": "-",
    "Gianluca Bacco": "-",
    "Gianluca Brotto": "-",
    "Matteo De Col": "-",
    "Filippo De Guio": "Responsabile",
    "Samuele Gobbi": "-",
    "Thomas Morettin": "-"
  )
)

#slide-title("Retrospettiva: Cose fatte nel periodo")

Negli ultimi 7 giorni, il gruppo si è concentrato sulle seguenti attività:

- *Analisi dei Requisiti:*
  - Stesura dei casi d'uso relativi all'autenticazione (UC1 - UC5).
  - Creazione dei diagrammi UML dei casi d'uso.
- *Infrastruttura:*
  - Setup della repository GitHub e pipeline Typst.
  - Creazione del sito vetrina (Cruscotto) per le metriche.
- *Metriche di periodo:*
  - Ore rendicontate: *22h* (in linea con il preventivo).

#pagebreak()

#slide-title("Pianificazione, Difficoltà e Dubbi")

*Cose da fare nel prossimo periodo:*
- Stesura dei requisiti qualitativi e di vincolo.
- Avvio dello sviluppo del Proof of Concept (PoC) in TypeScript.

*Difficoltà riscontrate:*
- Nessuna difficoltà critica rilevante in questo sprint.

*Dubbi per il Committente / Proponente:*
- *? Per il Prof. Cardin:* È preferibile mantenere i casi d'uso ad alto livello o dettagliare già i sotto-scenari alternativi?