% STRUTTURA DATI DEL PROBLEMA

% caratteristiche di ogni casa
colore(casa(Colore,_,_,_,_),Colore).
nazionalita(casa(_,Nazione,_,_,_),Nazione).
fuma(casa(_,_,Fuma,_,_),Fuma).
beve(casa(_,_,_,Beve,_),Beve).
animale(casa(_,_,_,_,Animale),Animale).


% caratteristiche di Case (posizione delle case tra loro) (esplico anche
% il fatto che Case ha 5 elementi)
a_destra(Dx,Sx,[Sx,Dx,_,_,_]).
a_destra(A,B,[_,B,A,_,_]).
a_destra(A,B,[_,_,B,A,_]).
a_destra(A,B,[_,_,_,B,A]).


% si potrebbe dichiarare accanto(A,B,Case) anche così
% accanto(A,B,Case):- a_destra(A,B,Case).
% accanto(A,B,Case):- a_destra(B,A,Case).

accanto(A,B,[A,B,_,_,_]).
accanto(A,B,[B,A,_,_,_]).

accanto(A,B,[_,B,A,_,_]).
accanto(A,B,[_,A,B,_,_]).

accanto(A,B,[_,_,A,B,_]).
accanto(A,B,[_,_,B,A,_]).

accanto(A,B,[_,_,_,B,A]).
accanto(A,B,[_,_,_,A,B]).

prima_casa(Prima,[Prima|_]).
in_mezzo(InMezzo,[_,_,InMezzo,_,_]).


/*
 * COME HO IMPOSTATO LA SRUTTURA DATI:
 *
 * casa(Colore,Nazione,Fuma,Beve,Animale).
 *
 * Case = [casa(Colore1,Nazione1,Fuma1,Beve1,Animale1),
 *     casa(Colore2,Nazione2,Fuma2,Beve2,Animale2),
 *     casa(Colore3,Nazione3,Fuma3,Beve3,Animale3),
 *     casa(Colore4,Nazione4,Fuma4,Beve4,Animale4),
 *     casa(Colore5,Nazione5,Fuma5,Beve5,Animale5),]
 */

risolvi(Q1,Q2):-

       % ipotesi:

       nazionalita(A,inglese),
       colore(A,rossa),

       nazionalita(B,spagnolo),
       animale(B,cane),

       colore(C,verde),
       beve(C,caffe),

       nazionalita(D,ucraino),
       beve(D,the),

       a_destra(E,F,Case),
       colore(E,verde),
       colore(F,avorio),

       fuma(G,winston),
       animale(G,lumache),

       colore(H,giallo),
       fuma(H,kools),

       in_mezzo(I,Case),
       beve(I,latte),

       nazionalita(J,norvegese),
       prima_casa(J,Case),

       fuma(K,chesterfield),
       accanto(K,L,Case),
       animale(L,volpe),

       animale(N,cavallo),
       fuma(M,kools),
       accanto(N,M,Case),

       fuma(O,lucky),
       beve(O,arancia),

       nazionalita(P,giapponese),
       fuma(P,parliaments),

       nazionalita(Q,norvegese),
       colore(R,blu),
       accanto(Q,R,Case),

       % domanda 1 (è un'ipotesi con entrambe le variabili)
       beve(S,acqua),
       nazionalita(S,Q1),

       % domanda 2
       animale(T,zebra),
       nazionalita(T,Q2),

       % Devo dire che tutte le ipotesi devono rientrare nel "vettore" Case (appartengono alla soluzione, definizione di validità ipotesi)

       member(A,Case),
       member(B,Case),
       member(C,Case),
       member(D,Case),
       member(E,Case),
       member(F,Case),
       member(G,Case),
       member(H,Case),
       member(I,Case),
       member(J,Case),
       member(K,Case),
       member(L,Case),
       member(M,Case),
       member(N,Case),
       member(O,Case),
       member(P,Case),
       member(Q,Case),
       member(R,Case),
       member(S,Case),
       member(T,Case),

       write('SOLUZIONE GENERALE:'),nl,nl,
       writeSol(Case),nl,!.


% utility per stampare la lista della soluzione (Case)
writeSol([]).
writeSol([H|T]):-
		  write(H),nl,
		  writeSol(T).
