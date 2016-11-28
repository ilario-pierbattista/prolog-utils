% Esercizio 8
% Scrivere un programma che, dopo aver chiesto e ottenuto in input una lista, chieda (fino a quando non viene immesso fine) un atomo A. Se l'atomo appartiene alla lista, ne trovi la posizione nella lista

% Predicato principale (legge la lista in input)
es8:-
    write('Inserisci lista: '),
    read(L),
    is_list(L),
    chiedi_atomo(L).

% Cicla la richiesta di un atomo finchè non scrivo fine
% 2 (If -> Then; Else) annidati forse non sono molto leggibili, ma almeno così scrivo un predicato solo
chiedi_atomo(L):-
    write('Inserisci atomo: '),
    read(X),
    (   dif(X, 'fine') ->
    	write('L\'atomo '),
        write(X),
    	(   nth1(E,L,X) ->  
            write(' si trova in posizione '),
            write(E);
            write(' non appartiene alla lista.')
        ),
        nl,
        chiedi_atomo(L);
    	true
    ).
