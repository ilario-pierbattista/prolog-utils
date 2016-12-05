% Esercizio 7
% Crivello di Eratostene: scrivere tutti i numeri primi minori o uguali a N

% Il procedimento è il seguente: si scrivono tutti i naturali a partire da 2 
% fino ad n in un elenco detto setaccio. Poi si cancellano (setacciano) tutti 
% i multipli del primo numero del setaccio (escluso lui stesso). Si prosegue 
% così fino ad arrivare in fondo. I numeri che restano sono i numeri primi minori
% od uguali a n. È come se si utilizzassero dei se­tacci a maglie via via più larghe: 
% il primo lascia passare solo i multipli di 2, il secondo solo i multipli di 3, e così via.


% Restituisce la lista di tutti i numeri primi fino a N
% ?- primi(30,L).
% L = [2,3,5,7,11,13,17,19,23,29]
primi(1,[]):-
    !.
primi(N,L):-
    N>0,
	test_primi(N,2,2,L),
    !.

% Predicato ausiliario: testa tutti i numeri N fino a M con tutti i possibili divisori D
test_primi(M,N,_,[]):-
    N>M.
test_primi(M,N,D,L):-
    D=<sqrt(N),
    mod(N,D)=\=0,
    DD is D+1,
	test_primi(M,N,DD,L).
test_primi(M,N,D,L):-
    dif(N,2), % Per come ragiona il predicato, il fatto che 2 sia primo è un'anomalia, quindi tocca rimediare un po' barbaramente
    mod(N,D)=:=0,
    NN is N+1,
    test_primi(M,NN,2,L).
test_primi(M,N,_,[N|L]):-
    NN is N+1,
    test_primi(M,NN,2,L).
