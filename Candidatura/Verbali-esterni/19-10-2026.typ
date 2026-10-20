#import "../../Template/tmp-verbale.typ": conf, decisioni

#show: conf.with(
  tipo: "Esterno", 
  data: "19 Ottobre 2026",
  ora-inizio: "12:30",
  ora-fine: "13:00",
  luogo: "Google Meet",
  azienda: "Haule SRL - Valentino Baraldo",
  presenti: ("Thomas Morettin ", "Gianluca Bacco ", "Corrado Bacco", "Gianluca Brotto ", "Matteo De Col", "Filippo De Guio", "Samuele Gobbi"),
  assenti: (),
  responsabile: "Filippo De Guio",
  redattore: "De Col Matteo",
  verificatore: "Filippo De Guio",
  changelog: (
    (ver: "1.1.0", data: "20/10/2026", autore: "De Col Matteo", ruolo: "Redattore", desc: "Correzione errori minori."),
    (ver: "1.0.0", data: "19/10/2026", autore: "De Col Matteo", ruolo: "Redattore", desc: "Creazione e stesura verbale.")

  )
)

= Introduzione
Il presente documento attesta che, in data 19 ottobre 2026, è avvenuto l'incontro con il proponente Haule SRL, in videoconferenza dalle ore 12:30 alle ore 13:00

= Ordine del giorno
L'incontro è stato indetto per chiarire i seguenti punti emersi dall'analisi preliminare del capitolato:
- Chiarimento su regolamento e tempistiche dei meeting periodici.
- Dettagli sul requisito RFO-14: preferenza tra rappresentazione grafica ad albero o file system per le dipendenze.
- Sezione 4.3: disponibilità di materiale guida/casi limite per l'analisi statica in Liquid, oltre alla documentazione Shopify.
- Livello di priorità assegnato alla funzionalità di diff (Requisito Funzionale Obbligatorio).
- Chiarimento sul concetto di "motore di ricerca estendibile" per la segnalazione degli errori.
- Gestione dell'autenticazione: necessità di inserimento automatico dei siti Shopify tramite Google Account.
- Chiarimento sul termine "import dei workflow di automazione" (requisito desiderabile).
- Scala di priorità tra i vari requisiti desiderabili.
- Stime sulle tempistiche di apprendimento delle tecnologie necessarie.

= Resoconto
Il rappresentate si è collegato puntuale alle ore 12:30 e ha iniziato a rispondere in modo chiaro ed esplicativo ad ogni domanda.
== Organizzazione del progetto, supporto e gestione dei requisiti
Il gruppo ha chiesto chiarimenti sulle tempistiche, l'approccio allo sviluppo e le priorità da assegnare ai requisiti desiderabili.
Il referente ha affermato di utilizzare un approccio flessibile, garantendo la sua disponibilità per rinegoziare i requisiti o trovare compromessi tecnici durante i lavori. Ha confermato che la quantità di requisiti desiderabili da coprire nell'MVP sarà definita in cooperazione man mano che lo sviluppo procede. Riguardo allo studio iniziale, ha stimato in un paio di settimane il tempo necessario per acquisire una buona base sulle API di Shopify e sul linguaggio Liquid; per facilitare questo step, l'azienda fornirà una sessione di training dedicata con un ingegnere. Infine, ha chiarito che l'applicativo ha una forte valenza pratica e che l'uso dell'intelligenza artificiale è consentito, a patto di mantenere un rigoroso metodo di sviluppo e una profonda comprensione delle tecnologie utilizzate.
== Architettura del sistema, visualizzazione e motore di regole
Il gruppo ha posto domande specifiche su come strutturare e visualizzare i dati, sul calcolo del diff e sul "motore di regole estendibile".
L'azienda ha chiarito che la visualizzazione grafica delle dipendenze è obbligatoria, ma ha lasciato libertà sulle scelte implementative. Per la funzionalità di diff, Sonar dovrà essere in grado di calcolare e confrontare le differenze tra due snapshot, in modo da segnalare chiaramente aggiunte o modifiche. Relativamente al motore di regole, è stato specificato che non fungerà da motore di ricerca, ma da sistema per notificare specifiche condizioni o debiti tecnici (ad esempio, un custom feed creato ma mai popolato). Le logiche di queste regole possono essere anche statiche e sarà possibile dotare il sistema di un'interfaccia dedicata per la loro implementazione.
== Integrazione con l'ecosistema Shopify: Liquid, Auth e Workflow
Il gruppo ha richiesto dettagli su specifiche funzionalità di dominio: l'analisi dei template, la gestione degli accessi e l'importazione delle automazioni.
Per prendere confidenza con i template Liquid, il proponente ha suggerito di partire da tecnologie simili (come JSP), di consultare la documentazione ufficiale e di ispezionare il codice di temi pronti (come "Horizon"). Sul fronte dell'autenticazione, è stato precisato che il tool non dovrà avere alcun collegamento con i servizi di accesso di Shopify: il gruppo dovrà limitarsi a implementare il login via Google Account per gestire la propria sicurezza interna, consumando poi le API di Shopify in modo separato. Infine, riguardo al requisito desiderabile dell'import dei workflow, l'idea di base prevede un'esportazione manuale da Shopify e un successivo import su Sonar; tuttavia, la reale fattibilità tecnica di questa operazione dovrà essere analizzata e valutata durante lo sviluppo.

= Conclusioni
L'incontro ha permesso di sciogliere i dubbi tecnici principali e di allineare la visione del Gruppo Astrum con le aspettative dell'azienda. Il Gruppo ringrazia Haule SRL per la disponibilità e il supporto formativo offerto.
