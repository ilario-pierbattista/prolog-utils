% Esercizio 17
% Scrivere un predicato che prenda in ingresso un atomo e stampi in ordine alfabetico tutte e sole le lettere minuscole che lo compongono, con la relativa frequenza

% Predicato principale
lettere(A):-
    name(A,L),
    include(between(97,122),L,LM), % Filtriamo tutto ciò che non è una lettera minuscola
    msort(LM,M),
    conta_freq(M,_,0,F),
    sort(M,MM), % In alternativa a list_to_set/2
    stampa_freq(MM,F).

% Conta le occorrenze degli elementi in una lista *ordinata*
conta_freq([],_,N,[N|[]]). % Non ci perdiamo l'ultimo!
conta_freq([L|LL],L,N,LF):-
    NN is N+1,
    conta_freq(LL,L,NN,LF),
    !. % Senza questo cut succedono cose buffe
conta_freq([L|LL],_,N,[N|LF]):-
    conta_freq(LL,L,1,LF).

% Stampa gli elementi corrispondenti di 2 liste (lunghe uguali!)
stampa_freq([],[]).
stampa_freq([L|L1],[F|L2]):-
    char_code(C,L),
    write(C),
    tab(4),
    write(F),
    nl,
    stampa_freq(L1,L2).
    