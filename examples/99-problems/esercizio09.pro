% Esercizio 9
% (a): scrivere un programma che legga da tastiera dei numeri interi positivi fino a quando non viene battuto stop e costruisca un dizionario binario.
% (b): scrivere un predicato che, dato un dizionario binario, ne stampi i nodi (non vuoti) in ordine crescente

% Predicato (a): costruisce un dizionario binario di interi
crea_alb(A):-
    lista_alb(L),
    ins_lista(L,A).

% Crea una lista dei valori letti in input
lista_alb([N|L]):-
    write('Inserisci numero (\'stop\' per completare): '),
    read(N),
    dif(N, 'stop'), 
    lista_alb(L),
    !.
lista_alb([]).

% Inserisce i valori di una lista in un albero binario (ordinato)
ins_lista([],nil).
ins_lista([X],A):-
    ins_alb(X,nil,A).
ins_lista([H|T],A):-
    ins_lista(T,AA),
    !,
    ins_alb(H,AA,A).

% Inserisce un nuovo valore nell'albero binario (ordinato)
ins_alb(X,nil,alb(X,nil,nil)):-
    !.
ins_alb(X,alb(N,L,R),alb(N,LL,R)):-
    X<N,
    ins_alb(X,L,LL),
    !.
ins_alb(X,alb(N,L,R),alb(N,L,RR)):-
    X>=N,
    ins_alb(X,R,RR),
    !.

% Predicato (b): visita inordine dell'albero e stampa i valori dei nodi
inorder_alb(alb(N,L,R)):-
    inorder_alb(L),
    write(N),
    write(' '),
	inorder_alb(R).
inorder_alb(nil).
