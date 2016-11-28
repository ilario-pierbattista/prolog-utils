% Esercizio 12
% Scrivere un predicato che, preso al primo argomento una lista di liste di interi, restituisca al secondo quella che contiene più elementi, ordinata in modo crescente con quicksort; restituisca poi al terzo argomento la lunghezza della lista restituita.

consult('../quicksort.pro').

% maplist/3 corrisponde alla map() degli altri linguaggi funzionali (la funzione da applicare è il primo argomento)
% ?- piu_lunga([[8,7,3],[9,2],[1,7,8,3]],L,D).
% L = [1,3,7,8], D = 4
piu_lunga(LL,L,D):-
    maplist(length,LL,LD),
    max_list(LD,D),
    nth1(I,LD,D),
    nth1(I,LL,L1),
    quicksort(L1,L).
