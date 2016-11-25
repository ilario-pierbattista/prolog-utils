% Esercizio 4
% Scrivere un programma che sostituisca un intero scelto con un atomo letterale scelto lasciando inalterato l’ordine.

% sost/4 è simile al predicato di libreria substitute/4
% ?- sost([1,3,1,2,1,8],1,a,L).
% L = [a,3,a,2,a,8]
sost([],_,_,[]).
sost([H|T],H,A,[A|L]):-
    sost(T,H,A,L),
    !.
sost([H|T],Z,A,[H|L]):-
    sost(T,Z,A,L).
    