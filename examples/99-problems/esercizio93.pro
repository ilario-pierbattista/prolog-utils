% PROBLEMA KNAPSACK
%
% Si consideri la seguente istanza del problema del knapsack. Lo zaino
% ha dimensione 38.
% Gli oggetti sono: il whisky che occupa 5, vale 15 e ce ne sono 2, il
% profumo che occupa 4,vale 10 e ce sono 6, il
% cioccolato che occupa 3 vale 6 e ce ne sono 10 e le sigarette che
% occupano 2 e valgono 7 e ce sono 8. C’è l’obbligo
% di almeno un whisky, e 2 cioccolate, mentre non c’è nessun obbligo per
% gli altri oggetti.

:- use_module(library(clpfd)).

go:-
		  % vincoli variabili
		  W in 1..2,
		  P in 0..6,
		  C in 2..10,
		  S in 0..8,
		  Vars = [W,P,C,S],

		  % funzione costo
		  5*W+4*P+3*C+2*S #=< 38,

		  % funzione obiettivo
		  FunzioneObiettivo = 15*W+10*P+6*C+7*S,

		  % trova soluzione problema
		  labeling([max(FunzioneObiettivo)],Vars),

		  % così stampa tutte le possibili soluzioni per backtracking
		  writeln([W,P,C]),
		  FunzioneObiettivo1 is 15*W+10*P+6*C+7*S,
		  write(FunzioneObiettivo1).


