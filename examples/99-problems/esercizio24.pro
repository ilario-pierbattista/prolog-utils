n_mi_el(L,N,L1):-
		  n_mi_el0(L,N,Unsort),
		  quicksort(Unsort,L1).

n_mi_el0([],_,[]).

n_mi_el0([H|T],N,L1):-
		  length(H,Length),
		  Length<N,
		  n_mi_el(T,N,L1).

n_mi_el0([H|T],N,[H1|T1]):-
		  length(H,Length),
		  Length>=N,
		  n_mo_el(H,N,H1,1),
		  n_mi_el(T,N,T1),!.


n_mo_el([_|T],N,El,CorrenteEl):-
		  CorrenteEl =\= N,
		  NewCorrenteElemento is CorrenteEl + 1,
		  n_mo_el(T,N,El,NewCorrenteElemento).
n_mo_el([H|_],N,H,CorrenteEl):-
		  CorrenteEl =:= N.

quicksort([],[]).
quicksort([H|T],Sort):-
		  divide(H,T,Min,Max),
		  quicksort(Min,MinSort),
		  quicksort(Max,MaxSort),
		  append(MinSort,[H|MaxSort],Sort),!.

divide(_,[],[],[]).
divide(N,[H|T],[H|TMin],Max):-
		  H<N,
		  divide(N,T,TMin,Max).
divide(N,[H|T],Min,[H|TMax]):-
		  H>=N,
		  divide(N,T,Min,TMax).
