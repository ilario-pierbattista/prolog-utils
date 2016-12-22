% Quicksort (i predicati sort/2 e msort/2 implementano il mergesort in SWI-Prolog)
% ?- quicksort([3,7,1,0,3,6,2,4],S).
% S = [0,1,2,3,3,4,6,7]
quicksort(L,S):-
    qsort(L,[],S),
    !.
qsort([],A,A).
qsort([H|T],A,S):-
	pivot(H,T,L1,L2),
	qsort(L1,A,S1),
    qsort(L2,[H|S1],S).
pivot(_,[],[],[]).
pivot(H,[X|T],[X|L],R):-
    X@>=H,
    pivot(H,T,L,R).
pivot(H,[X|T],L,[X|R]):-
    X@<H,
    pivot(H,T,L,R).
    