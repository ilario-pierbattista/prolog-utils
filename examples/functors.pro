% La lezione di intelligenza artificiale viene tenuta il mercoledì dalle
% 15:30 alle 17:30 da Aldo Dragoni a Quota 155 in aula D2

% Approccio ignorante
lezione_tenuta(ia, merc, 1530, 1730, 155, d2, aldragoni).
% La conoscienza in questo modo viene appiattita. Elementi di natura
% molto diversa tra di loro vengono inseriti nello stesso predicato, pur
% avendo differenti gradi di significatività nel complesso.
%
% ia ed aldragoni sono atomi.
%
% (merc, 1530, 1730) rappresenta delle coordinate temporali nel
% complesso, ma nello specifico delle singole componenti, perdono di
% significatività all'interno della frase. Stessa cosa per (155, d2).
lezione(ia, orario(merc, 1530, 1730), luogo(155, d2), aldragoni).

% Scrivere un programma docente(Docente, Corso)
docente(Docente, Corso) :-
	lezione(Corso, _, _, Docente).

% durata(Lezione, Durata)
durata(Lezione, Durata)	:-
	lezione(Lezione, orario(_, Inizio, Fine), _, _),
	Durata is Fine - Inizio.

% prof(Prof, Giorno)
prof(Prof, Giorno) :-
	lezione(_, orario(Giorno,_,_), _, Prof).
