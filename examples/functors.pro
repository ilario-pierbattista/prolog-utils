/*
 * Funtori
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 Ilario Pierbattista et Al.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

% Si vuole codificare la seguente frase: "La lezione di intelligenza
% artificiale viene tenuta il mercoledì dalle 15:30 alle 17:30 da Aldo
% Dragoni a Quota 155 in aula D2".
%
% In prima approssimazione si può scrivere un predicato con 7 argomenti:
lezione_tenuta(ia, merc, 1530, 1730, 155, d2, aldragoni).

% La conoscienza in questo modo viene appiattita. Elementi di natura
% molto diversa vengono inseriti nello stesso predicato, pur avendo
% differenti gradi di significatività nel complesso.
%
% Si noti che ia ed aldragoni sono atomi.
% (merc, 1530, 1730) rappresenta delle coordinate temporali nel
% complesso, ma nello specifico delle singole componenti, perdono di
% significatività all'interno della frase. Stessa cosa per (155, d2).
%
% Si utilizzano i funtori per raggruppare dati in modo consistente,
% ottenendo il seguente predicato (che costituisce la nostra base di
% conoscenza).
lezione(ia, orario(merc, 1530, 1730), luogo(155, d2), aldragoni).

%!	docente(-Docente:atom, -Corso:atom) is nondet.
% Enumera i corsi tenuti dai docenti.

%!	docente(+Docente:atom, -Corso:atom) is nondet.
% Enumera tutti i corsi tenuti dal Docente.

%!	docente(-Docente:atom, +Corso:atom) is nondet.
% Enumera tutti i docenti che tengono uno specifico Corso.

%!	docente(+Docente:atom, +Corso:atom) is semidet.
% Controlla che Docente tenga il Corso.
docente(Docente, Corso) :-
	lezione(Corso, _, _, Docente).


%!	durata(-Lezione:atom, -Durata:int) is nondet.
% Enumera le lezioni e le relative durate.

%!	durata(+Lezione:atom, -Durata:int) is det.
% Cerca la Durata della Lezione (espressa nel formato %h%mm, con h->ore
% e mm -> minuti).

%!	durata(-Lezione:atom, +Durata:int) is nondet.
% Cerca le lezioni con una data Durata.

%!	durata(+Lezione:atom, +Durata:int) is semidet.
% Verifica che la Lezione abbia una data Durata.
durata(Lezione, Durata)	:-
	lezione(Lezione, orario(_, Inizio, Fine), _, _),
	Durata is Fine - Inizio.


%!	durata(-Lezione:atom, -Durata:int) is nondet.
% Enumera le lezioni e le relative durate.

%!	durata(+Lezione:atom, -Durata:int) is det.
% Cerca la Durata in minuti della Lezione.

%!	durata(-Lezione:atom, +Durata:int) is nondet.
% Cerca le lezioni con una data Durata (in minuti).

%!	durata(+Lezione:atom, +Durata:int) is semidet.
% Verifica che la Lezione abbia una data Durata (in minuti).
durata_minuti(Lezione, Durata) :-
	lezione(Lezione, orario(_, Inizio, Fine), _, _),
	DurataRaw is Fine - Inizio,
	DurataOre is div(DurataRaw, 100),
	DurataMinuti is mod(DurataRaw, 100),
	Durata is DurataMinuti + (DurataOre * 60).

%!	prof(-Prof:atom, -Giorno:atom) is nondet.
% Enumera i Prof che tengono le loro lezioni ed i relati giorni.

%!	prof(+Prof:atom, -Giorno:atom) is nondet.
% Enumera i giorni in cui un Prof ha lezione.

%!	prof(-Prof:atom, +Giorno:atom) is nondet.
% Enumera i Prof che tengono le loro lezioni in un dato Giorno.

%!	prof(+Prof:atom, +Giorno:atom) is semidet.
% Verifica che il Prof tenga la sua lezione in un dato Giorno.
prof(Prof, Giorno) :-
	lezione(_, orario(Giorno,_,_), _, Prof).



/*
 * ------------------------------------------
 * TEST
 * ------------------------------------------
 */
:- begin_tests(functors).
test(lectures) :-
	D = aldragoni,
	L = ia,
	Durata = 200,
	DurataMinuti = 120,
	Giorno = merc,

	docente(D,L),
	durata(L, Durata),
	durata_minuti(L, DurataMinuti),
	prof(D, Giorno).
:- end_tests(functors).













