% Esercizio 13
% Scrivere un programma che legga da tastiera due numeri naturali (scritti come atomi PROLOG) e ne stampi la somma

% Predicato richiesto run/0 (atom_number/2 lo rende di una banalità pazzesca)
% Ricordate, bambini: MAI reinventare la ruota!
run:-
    write('dai il primo numero: '),
    read(X1),
    write('dai il secondo numero: '),
    read(X2),
    atom_number(X1,N1),
    atom_number(X2,N2),
    N is N1+N2,
    write('La somma di '),
    write(N1),
    write(' e di '),
    write(N2),
    write(' è '),
    write(N).
    