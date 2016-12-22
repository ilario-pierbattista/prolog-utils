% Esercizio 10
% Scrivere un predicato che, dopo aver chiesto e ottenuto in input da tastiera una lista, chiede (fino a quando non viene immesso fine) un numero intero N e stampi l'elemento che si trova in N-esima posizione

% Predicato principale; legge la lista in input
trova_elemento():-
    write('Inserisci lista: '),
    read(L),
    is_list(L),
    chiedi_posizione(L).

% Cicla la richiesta di una posizione finchè non scrivo fine
% 2 (If -> Then; Else) annidati forse non sono molto leggibili, ma almeno così scrivo un predicato solo
chiedi_posizione(L):-
    write('Inserisci N: '),
    read(N),
    (   dif(N, 'fine') ->
    	write('L\'elemento n.'),
        write(N),
    	(   nth1(N,L,X) ->  
            write(' è '),
            write(X);
            write(' non esiste.')
        ),
        nl,
        chiedi_posizione(L);
    	true
    ).
