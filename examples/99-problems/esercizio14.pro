% Esercizio 14
% Scrivere un predicato che, dopo aver letto da tastiera una successione di numeri naturali terminata da 0, stampi il numero di volte che compare l'ultimo elemento < 10 (escluso lo zero)

% Predicato principale
run:-
    write('Inserisci numeri (0 per terminare):'),
    leggi_lista(L),
    exclude(<(10),L,LL), % A quanto pare il goal va all'opposto di come andrebbe messo intuitivamente...
    (   dif(LL,[]) ->  
    	last(LL,N),
    	exclude(dif(N),LL,LN),
        length(LN,E),
        write('Ci sono '),
        write(E),
        write(' elementi uguali a '),
        write(N);
    	write('Nessun elemento < 10')
    ).

% Crea una lista dei valori letti in input
leggi_lista([N|L]):-
    read(N),
    dif(N, 0), 
    leggi_lista(L),
    !.
leggi_lista([]).
