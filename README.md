# Prolog utilities [![Build Status](https://travis-ci.org/ilario-pierbattista/prolog-utils.svg?branch=master)](https://travis-ci.org/ilario-pierbattista/prolog-utils)
Definizioni di predicati ausiliari al linguaggio e raccolta di esercizi risolti durante le lezioni di Intelligenza Artificiale, tenute nell'anno accademico 2016/17 presso l'Università Politecnica delle Marche dal Prof. Aldo Franco Dragoni.

## Struttura delle directory
	/doc
	/lib
	/test
	/examples
* L cartella `doc` contiene degli appunti sullo SWI-Prolog
* La cartella `lib` contiene la definizione di predicati sufficientemente utili da poter essere selezionati per estendere il set di predicati built-in nel linguaggio.
* La directory `test` contiene la definizione degli unit test riferiti ai predicati definiti nella cartella `lib`.
* La cartella `examples` contiene una raccolta di esercizi fatti a lezione, suddivisi per aree funzionali e, quando possibile, datati.

## Eseguire i Test
I predicati nella cartella `lib` sono correlati di test unitari (cartella `test`). Per eseguire i test è necessario **compilare il file** `unittest.pro` e lanciare nella console:

	?- run_tests.

Anche i listati nella cartella `examples` vengono correlati di test unitari. Sono definiti all'interno dei file stessi che definiscono i predicati e per eseguirli è sufficiente **eseguire** il comando `?- run_tests` **una volta compilato il file**.

## Compilare il file singoli
Tutti i file hanno estensione `.pro`. Ciò non è del tutto conforme con lo SWI-Prolog, quindi bisogna **forzare la compilazione in prolog**. Per fare ciò è sufficiente cliccare in `File > Mode > prolog`.
Non è consigliabile lavorare con file in estensione `.pl` (e non verranno usati in questo repository) in quanto, nella maggior parte dei sistemi, tale estensione è associata agli script perl.

## Documentazione
È disponibile, per molti predicati, una documentazione navigabile (simile al *javadoc*, per intenderci).
Compilato un file, è possibile navigarne la documentazione - se presente - dal browser web.
Bisogna avviare il server interno per la documantazione (si può usare una porta a piacere a posto della 4000). Eseguire:

	?- doc_server(4000).

Quindi è sufficiente visitare [](http://localhost:4000).

La struttura dei commenti strutturati in Prolog è molto rigida ed ha una precisa semantica (definita parzialmente [qui](http://www.swi-prolog.org/pldoc/man?section=modes)).

## Appunti
[Appunti SWI-Prolog](doc/index.md)
