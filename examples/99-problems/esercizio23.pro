piu_piccolo(L,V):-
		  piu_piccolo0(L,V,-1).

piu_piccolo0([],Min,Min).
piu_piccolo0([H|T],V,Min):-
		  arg(1,H,N),
		  (Min =:= -1; N < Min),!,
		  piu_piccolo0(T,V,N).
piu_piccolo0([H|T],V,Min):-
		  arg(1,H,N),
		  N >= Min,
		  piu_piccolo0(T,V,Min).


ordina(L,L1):-
		  assegna(L,V),
		  quicksort(V,S),
		  reverse(S,I),
		  assegna(L1,I).
/***ASSEGNA***/
/**
 * assegna(?Funtore,?Argomento)
 * ?Funtore è una lista  del tipo: a(I)
 * ?Argomento è una lista di I
 */
assegna([],[]).
assegna([H1|T1],[H2|T2]):-
		  H1 =.. [a,H2],
		  assegna(T1,T2).


/***QUICKSORT***/

quicksort([],[]).
quicksort([H|T],Sort):-
		  divide(H,T,Minori,Maggiori),
		  quicksort(Minori,MinoriSort),
		  quicksort(Maggiori,MaggioriSort),
		  append(MinoriSort,[H|MaggioriSort],Sort),!.
divide(_,[],[],[]).
divide(H,[N|T],[N|TMinori],Maggiori):-
		  N<H,

		  divide(H,T,TMinori,Maggiori).
divide(H,[N|T],Minori,[N|TMaggiori]):-
		  N>=H,
		  divide(H,T,Minori,TMaggiori).
