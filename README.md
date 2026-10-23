# Repository documentale
Il seguente repository contiene tutta la documentazione inerente al progetto del gruppo Astrum, del corso di **Ingegneria del Software [SC01103936]** presso l'Università di Padova (L.T. Informatica, A.A. 2026/27).

## Contenuto del repository
Il lavoro è suddiviso per milestone di progetto:
* **Way of Woking** di gruppo, ovvero il regolamento (con miglioramento periodico) che guida le decisioni durante tutta la durata del progetto;
* **Candidatura**, contenente:
  * lettera di candidatura rivolta ai committenti;
  * documenti di analisi dei capitolati presentati dalle aziende proponenti;
  * preventivo costi/ripartizione ore per l'azienda proponente scelta dal gruppo;
  * verbali interni/esterni scritti in fase di analisi e preparazione della candidatura;
  * diario di bordo svoltosi in data 2026-10-26.
 
## GitHub Actions
Il seguente repository fa uso di 2 GitHub Actions:
1. [typst-compile.yml](.github/workflows/typst-compile.yml) per la compilazione automatica di tutti i file, scritti in linguaggio Typst, in formato PDF;
2. [typst-indexing.yml](.github/workflows/typst-indexing.yml) per la generazione di una pagina statica di indice dove è possibile avere una visione d'insieme di tutti gli artefatti creati dalla Action precedente; questa funzione è utile alla figura di amministratore per l'aggiornamento costante del sito web "cruscotto".
 
## Visualizzazione dei documenti
Tutti i documenti compilati in formato PDF sono reperibili all'interno del sito web "cruscotto" del gruppo.
