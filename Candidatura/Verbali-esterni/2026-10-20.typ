#import "../../Template/tmp-verbale.typ": conf, decisioni

#show: conf.with(
  tipo: "Esterno", 
  data: "2026-10-20",
  ora-inizio: "15:00",
  ora-fine: "16:00",
  luogo: "Google Meet",
  azienda: "Sanmarco Informatica SpA - Linda Benozzato, Luca Marcon",
  presenti: ("Thomas Morettin ", "Gianluca Bacco ", "Corrado Bacco", "Gianluca Brotto ", "Matteo De Col", "Filippo De Guio", "Samuele Gobbi"),
  assenti: (),
  responsabile: "Filippo De Guio",
  redattore: "De Col Matteo",
  verificatore: "Gianluca Brotto",
  changelog: (
    (ver: "1.0.0", data: "2026-10-21", autore: "De Col Matteo", ruolo: "Redattore", desc: "Creazione e stesura verbale."),
  )
)

= Introduzione
Il presente documento attesta che, in data 20 ottobre 2026, è avvenuto l'incontro con il proponente Sanmarco Informatica SpA, in videoconferenza dalle ore 15:00 alle ore 16:00.

= Ordine del Giorno
L'incontro è stato indetto per sciogliere i seguenti dubbi tecnico-organizzativi emersi dall'analisi del capitolato:
- Necessità di validazione umana in caso di bassa confidenza del modello AI.
- Logiche di funzionamento del "Filtro Sicurezza" per l'identificazione del tenant e la gestione di utenti non reperibili.
- Eventuale supporto formativo sulle tecnologie consigliate per il progetto.
- Definizione dei canali previsti per l'ingresso delle richieste (es. ticket di assistenza, WhatsApp, e-mail) nell'MVP.
- Gestione e persistenza dell'anagrafica clienti.
- Requisiti di sicurezza in ingresso (filtri antispam) e normative sulla privacy per i dati sensibili.
- Fornitura dei dati per il testing (es. finti ordini, reclami, audio).
- Gestione di intenzioni multiple all'interno di un singolo documento elaborato.
- Scelta e configurazione delle API (modelli open-source vs licenze commerciali) e gestione degli errori di sistema.
- Metriche di valutazione del prodotto finale e relative soglie di accettazione.

= Resoconto

== Canali di ingresso, Filtri dati e Sicurezza
- È stato confermato che l'MVP si concentrerà principalmente su e-mail (inclusi allegati) e comunicazioni WhatsApp (messaggi testuali e vocali). Anche una semplice e-mail sarà considerata a tutti gli effetti un ticket di assistenza. L'aggiunta di canali futuri richiederà l'intervento degli sviluppatori e non sarà configurabile in autonomia dall'utente finale.
- Il "Filtro Sicurezza" per l'isolamento dei dati e l'identificazione del tenant si baserà su un'anagrafica preesistente, importata nel sistema (ad esempio tramite un batch da un gestionale esterno). Il blocco delle richieste provenienti da utenti non censiti e il filtro antispam (inclusa la prevenzione di elaborazioni duplicate) sono funzionalità richieste per l'MVP. La gestione di utenti non reperiti tramite un sistema di riconoscimento avanzato è considerata solo una miglioria opzionale.
- Il trattamento dei dati sensibili richiede una progettazione "secure by default and by design". L'accesso alla dashboard amministrativa web-based dovrà essere differenziato tramite permessi specifici (RBAC). I dati salvati, come i PDF importati, dovranno essere cifrati. Inoltre, per i modelli linguistici (LLM) responsabili dell'elaborazione semantica, è richiesto l'utilizzo di server posizionati in "region europee" per ottemperare alle rigide normative sul trattamento dei dati, accettando l'eventuale impatto sulle performance.

== Modelli AI, Elaborazione e Metriche di Valutazione
- L'infrastruttura AI utilizzerà modelli "open-weight" basati su open API, garantendo un'interfaccia modulare per consentire future modifiche.
- Non è richiesta un'accuratezza perfetta dall'Intelligenza Artificiale. L'interfaccia per la validazione umana dei dati è considerata una feature opzionale per l'output finale; tuttavia, i risultati automatici devono essere sufficientemente precisi di base.
- Qualora il sistema individui più intenzioni all'interno del medesimo documento (es. ordine + reclamo), dovrà estrarne e registrarne solo una (la principale). La presenza di richieste secondarie andrà tracciata nei log per consentire all'utente di valutarle in un secondo momento.
- In caso di errori di sistema, sarà sufficiente registrarli nei log affinché siano visualizzati nella dashboard amministrativa. Casistiche di errore inedite verranno discusse con l'azienda in seguito.
- La metrica principale per valutare il successo del prodotto sarà la percentuale di elaborazioni andate a buon fine, con una soglia minima fissata al 70%. L'accuratezza formale dell'estrazione è considerata una metrica secondaria. Durante le fasi di sviluppo, il gruppo stesso garantirà la qualità testando empiricamente i dati estratti.

== Organizzazione, Formazione e Testing
- L'azienda stima per il progetto un effort complessivo di circa 1000 ore di sviluppo, pari a un mese di lavoro a tempo pieno per il team, che richiederà impegno personale.
- Non è prevista una formazione erogata direttamente dall'azienda sulle tecnologie consigliate; il gruppo dovrà acquisire le competenze in autonomia. È comunque consentito proporre tecnologie alternative se ritenute più funzionali. Sanmarco Informatica SPA garantirà comunque momenti di confronto per chiarire dubbi tecnico-organizzativi.
- Per la fase di testing, l'azienda fornirà i necessari dati mock per e-mail e ordini. Per quanto riguarda la parte audio, il gruppo potrà registrare le clip in autonomia seguendo la documentazione che verrà fornita dall'azienda.

= Conclusioni
L'incontro ha permesso di definire chiaramente i confini tecnici dell'MVP e ha sciolto i principali dubbi relativi alla sicurezza, alle tecnologie e alla gestione degli output. Il Gruppo Astrum ringrazia Sanmarco Informatica SPA per la disponibilità e le esaustive spiegazioni fornite.