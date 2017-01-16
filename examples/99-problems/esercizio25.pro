on(1,1).
on(3,3).
on(4,3).
on(5,3).
on(6,3).
on(7,3).
on(3,4).
on(3,5).
on(3,6).
on(3,7).
on(7,4).
on(7,5).
on(7,6).
on(7,7).
on(4,7).
on(5,7).
on(6,7).

/* punto(-X,-Y)
 *  restituisca le coordinate X,Y di punto acceso isolato
 */
punto(X,Y):-
		  on(X,Y),
		  Xm is X -1,
		  XM is X+1,
		  Ym is Y-1,
		  YM is Y+1,
		  \+(on(XM,Y)),
		  \+(on(XM,YM)),
		  \+(on(XM,Ym)),
		  \+(on(X,YM)),
		  \+(on(X,Ym)),
		  \+(on(X-1,Y)),
		  \+(on(Xm,YM)),
		  \+(on(Xm,Ym)).

/* segmento(?X1,?Y1,?X2,?Y2)
 *  verifica e/o restituisce i due punti P1(X1,Y1) e P2(X2,Y2) estremi
 *  di un segmento orizzontale, verticale o diagonale, di pixel accesi
 */
segmento(X1,Y1,X2,Y2):-
		  (
                  segmentoOri(X1,Y1,X2,Y2);
		  segmentoOri(X2,Y2,X1,Y1);
                  segmentoVer(X1,Y1,X2,Y2);
		  segmentoVer(X2,Y2,X1,Y1);
                  segmentoDC(X1,Y1,X2,Y2);
		  segmentoDC(X2,Y2,X1,Y1);
                  segmentoDD(X1,Y1,X2,Y2);
		  segmentoDD(X2,Y2,X1,Y1)

				  ).

% Verifica segmento orizzontale
segmentoOri(X1,Y1,X2,Y1):-
		  on(X1,Y1),
		  on(X2,Y1),
		  Xs is X1 - 1, % verifico che P1 e P2 siano dei papabili estremi
		  \+(on(Xs,Y1)),
		  X2d is X2 + 1,
		  \+(on(X2d,Y1)),
		  Xd is X1 + 1,
		  verificaOrizzontale(X1,X2,Xd,Y1). % verifico continuita punti intermedi

% verifica segmento verticale
segmentoVer(X1,Y1,X1,Y2):-
		  on(X1,Y1),
		  on(X1,Y2),
		  Ydown is Y1 - 1,
		  \+(on(X1,Ydown)),
		  Y2up is Y2 + 1,
		  \+(on(X1,Y2up)),
		  Yup is Y1 + 1,
		  verificaVerticale(Y1,Y2,Yup,X1).

% verifica segmento diagonale crescente (superiore)
segmentoDC(X1,Y1,X2,Y2):-
		  on(X1,Y1),
		  on(X2,Y2),
		  Y1down is Y1 - 1,
		  X1s is X1 - 1,
		  \+(on(X1s,Y1down)),
		  Y2up is Y2 + 1,
		  X2d is X2 + 1,
		  \+(on(X2d,Y2up)),
		  Xd is X1 + 1,
		  Yup is Y1 + 1,
		  verificaDiagonaleSup(X1,Y1,X2,Y2,Xd,Yup).

% verifica segmento diagonale decrescente (inferiore)
segmentoDD(X1,Y1,X2,Y2):-
		  on(X1,Y1),
		  on(X2,Y2),
		  Y1up is Y1 + 1,
		  X1s is X1 - 1,
		  \+(on(X1s,Y1up)),
		  Y2down is Y2 - 1,
		  X2d is X2 + 1,
		  \+(on(X2d,Y2down)),
		  Xd is X1 + 1,
		  Ydown is Y1 - 1,
		  verificaDiagonaleInf(X1,Y1,X2,Y2,Xd,Ydown).




verificaOrizzontale(_,X2,X2,_).
verificaOrizzontale(X1,X2,X3,Y1):-
		  on(X3,Y1),
		  X3New is X3 + 1,
		  verificaOrizzontale(X1,X2,X3New,Y1).

verificaVerticale(_,Y2,Y2,_).
verificaVerticale(Y1,Y2,Y3,X1):-
		  on(X1,Y3),
		  Y3New is Y3 + 1,
		  verificaVerticale(Y1,Y2,Y3New,X1).

verificaDiagonaleSup(_,_,X2,Y2,X2,Y2).
verificaDiagonaleSup(X1,Y1,X2,Y2,X3,Y3):-
		  on(X3,Y3),
		  X3New is X3 + 1,
		  Y3New is Y3 + 1,
		  verificaDiagonaleSup(X1,Y1,X2,Y2,X3New,Y3New).

verificaDiagonaleInf(_,_,X2,Y2,X2,Y2).
verificaDiagonaleInf(X1,Y1,X2,Y2,X3,Y3):-
		  on(X3,Y3),
		  X3New is X3 + 1,
		  Y3New is Y3 - 1,
		  verificaDiagonaleInf(X1,Y1,X2,Y2,X3New,Y3New).

/***rettangolo(X1,Y1,X2,Y2,X3,Y3,X4,Y4)
 * verifichi che le quattro coppie di coordinate
 * corrispondano a quattro punti costituenti, ordinatamente, i vertici
 * di un rettangolo
 */
rettangolo(X1,Y1,X2,Y2,X3,Y3,X4,Y4):-
		  segmentoOri(X1,Y1,X2,Y2),
		  segmentoVer(X2,Y2,X3,Y3),
		  segmentoOri(X3,Y3,X4,Y4),
		  segmentoVer(X4,Y4,X1,Y1),
		  Y1=\=Y3,
		  Y2=\=Y4,
		  X2=\=X4,
		  X3=\=X1.

