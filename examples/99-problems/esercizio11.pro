% Esercizio 11
% Scrivere un programma che determini il percorso che unisce due nodi in ingresso. Il percorso venga restituito come una lista ordinata delle label degli archi utili.

% Lista degli archi (label, partenza, arrivo, costo)
arco('a','1','4',3).
arco('b','2','5',4).
arco('c','3','8',15).
arco('d','4','6',8).
arco('e','5','8',7).
arco('f','6','7',2).
arco('g','6','8',4).
arco('h','7','9',2).
arco('i','8','12',6).
arco('l','7','11',6).
arco('m','9','10',3).

% Predicato principale (partenza, arrivo, percorso)
% ?- trova_percorso('1','11',P).
% P = [a,d,f,l] (Costo = 19)
trova_percorso(P,A,LL):-
    percorso(P,A,LL,0).

% Predicato ausiliario (partenza, arrivo, lista label, costo)
percorso(A,A,[],C):-
    write('Costo = '),
    write(C).
percorso(P,A,[L|LL],C):-
    arco(L,P,X,Z),
    CN is C+Z,
    percorso(X,A,LL,CN).
    