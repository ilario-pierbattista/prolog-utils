% Esercizio 3:
% Scrivere due predicati per calcolare l’intersezione e l’unione di due “insiemi” liste.

% intersezione/3 è equivalente al predicato di libreria intersection/3
% ?- intersezione([1,3,5,2,4],[6,1,2],L).
% L = [1,2]
intersezione([],_,[]).
intersezione([H|T1],L2,[H|L]):-
    memberchk(H,L2),
    !,
    intersezione(T1,L2,L).
intersezione([_|T1],L2,L):-
    intersezione(T1,L2,L).

% unione/3 è equivalente al predicato di libreria union/3
% ?- unione([1,3,5,2,4],[6,1,2],L).
% L = [3,5,4,6,1,2]
unione([],L,L).
unione([H|T1],L2,L):-
    memberchk(H,L2),
    !,
    unione(T1,L2,L).
unione([H|T1],L2,[H|L]):-
    unione(T1,L2,L).
