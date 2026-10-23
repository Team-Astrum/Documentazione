#import "../../Template/tmp-verbale.typ": conf, decisioni

#show: conf.with(
  tipo: "Interno", 
  data: "2026-10-16",
  ora-inizio: "14:30",
  ora-fine: "17:00",
  luogo: "Discord",
  azienda: none,
  presenti: ("Thomas Morettin ", "Gianluca Bacco ", "Corrado Bacco", "Gianluca Brotto ", "Matteo De Col", "Filippo De Guio", "Samuele Gobbi"),
  assenti: (),
  redattore: "Gianluca Bacco",
  verificatore: "Corrado Bacco",
  changelog: (
    (ver: "1.0.0", data: "2026-10-16", autore: "Gianluca Bacco", ruolo: "Redattore", desc: "Creazione verbale."),
  )
)

= Introduzione
Il presente documento attesta che, in data 16 ottobre 2026, si è tenuta in modalità virtuale la prima riunione del gruppo Astrum. L’incontro è stato organizzato con lo scopo di formulare un way of working iniziale e pensare al nome e al logo del gruppo. 

= Resoconto

== Scelta del nome
 Dopo una breve serie di proposte, si è deciso di adottare *Astrum* come nome ufficiale del gruppo su proposta di Thomas Morettin.

== Creazione della mail 
In seguito, per gestire le comunicazioni ufficiali verso l'esterno, è stata creata la seconda mail:  *astrum.unipd\@gmail.com*

== Creazione del logo
Thomas Morettin ha proposto due versioni del logo: una versione ottimizzata per contesti di grandi dimensioni e una versione compatta per spazi ridotti. Le proposte sono state accolte all'unanimità e sono riportate di seguito:

#figure(
  grid(
    columns: (1fr, 1fr), // Divide lo spazio orizzontale in due parti uguali
    gutter: 1cm,         // Spazio tra le due immagini
    align: center + horizon,
    
    // Prima immagine con didascalia
    figure(
      image("../../Template/Assets/logo.svg", height: 1cm),
      caption: [Versione logo grande],
      kind: "image",
      supplement: [Figura]
    ),
    
    // Seconda immagine con didascalia
    figure(
      image("../../Template/Assets/logo-ridotto.svg", height: 1cm),
      caption: [Versione logo piccolo],
      kind: "image",
      supplement: [Figura]
    )
  ),
  caption: none // Opzionale: evita una didascalia globale del grid
)


== Scelta canali di comunicazione
Sono stati adottati i seguenti canali di comunicazione:
- *Whatsapp* per comunicazioni quotidiane;

- *Discord* come piattaforma per riunioni da remoto.

== Discussione capitolati
Dopo un confronto tra i componenti del gruppo, si è giunti al segeunte ordine di preferenza per i capitolati proposti:  
+ *C6 Caching Semantico* da *VarGroup*
+ *C0 AIRA* proposto da *SanMarco*
+ *C8 Sonar* proposto da *Haule*


Si è deciso di contattare i proponenti dei capitolati per avere maggiori informazioni e chiarimenti sui capitolati stessi. Dopo il mancato riscontro da parte di Vargroup, si è deciso di spostare il capitolato C6 in ultima posizione.
       

== Organizzazione repository
E' stato deciso di utilizzare la piattaforma *GitHub* per la gestione del codice sorgente e dei documenti del progetto. E' stata creata un' organizzazione per facilitare la navigazione e la gestione dei file.
Inoltre, verrà realizzato un sito web per la presentazione del progetto, che sarà ospitato su GitHub Pages. Il sito conterrà informazioni sul progetto, documentazione tecnica e aggiornamenti sullo stato di avanzamento.

== Organizzazione documentale 
E' stato deciso di utilizzare Typst per la redazione dei documenti del progetto, in quanto consente di generare documenti in modo semplice e veloce. Sono stati scelti i template per i diversi tipi di documenti, come verbali, relazioni e presentazioni, in modo da garantire una coerenza stilistica e una maggiore efficienza nella redazione di questi. Inoltre, useremo Github Actions per automatizzare la generazione dei documenti PDF a partire dai template e dai documenti del progetto.


= Conclusione
Il gruppo ha stabilito che si terrà una riunione interna il giorno 20/10/2026 alle ore 16:00 dopo aver ricevuto i feedback dai proponenti dei capitolati.
 
