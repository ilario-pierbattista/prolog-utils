/* possibili mosse cavallo su scacchiera 8x8 */
/* esercizio presente sul latex */

posizione(X/Y,P):-
		  valido(X,Y),
		  findall(Xn/Yn,(nuova_posizione(X,Y,Xn,Yn),valido(Xn,Yn)),P).

nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 + 1,
		  Y2 is Y1 + 2.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 + 2,
		  Y2 is Y1 + 1.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 - 1,
		  Y2 is Y1 + 2.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 - 2,
		  Y2 is Y1 + 1.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 - 1,
		  Y2 is Y1 - 2.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 - 2,
		  Y2 is Y1 - 1.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 + 1,
		  Y2 is Y1 - 2.
nuova_posizione(X1,Y1,X2,Y2):-
		  X2 is X1 + 2,
		  Y2 is Y1 - 1.


valido(X,Y):-
		  X>=1,
		  X=<8,
		  Y>=1,
		  Y=<8.

