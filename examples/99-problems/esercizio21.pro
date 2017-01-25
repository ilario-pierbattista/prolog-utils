% Esercizio 21
% Scrivere un predicato che, prendendo in input una lista di interi e due interi A<B, restituisca tutti gli interi della lista esterni a [A,B], ordinati in ordine crescente con mergesort

% Predicato principale
% ?- ord([1,2,3,4,5,6],2,4,LO).
% LO = [1,5,6]
ord(LI,A,B,LO):-
    A<B,
    exclude(between(A,B),LI,O),
    msort(O,LO).
