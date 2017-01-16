% caso stesso ordine di grandezza (maggiore)
diff(N1,N2,N,Segno):-
		  length(N1,L1),
		  length(N2,L2),
		  L1 = L2,
		  verificaMaggiore(N1,N2),
		  reverse(N1,NRev1),
		  reverse(N2,NRev2),
		  differenza(NRev1,NRev2,DiffRev,0),
		  reverse(DiffRev,M),
		  togliZeri(M,N),
		  Segno = "+",!.

% caso ordine di grandezza differente (maggiore)
diff(N1,N2,N,Segno):-
		  length(N1,L1),
		  length(N2,L2),
		  L1 > L2,
		  reverse(N1,NRev1),
		  reverse(N2,NRev2),
		  differenza(NRev1,NRev2,DiffRev,0),
		  reverse(DiffRev,M),
		  togliZeri(M,N),
		  Segno = '+',!.

% caso stesso ordine di grandezza (minore)
diff(N1,N2,N,Segno):-
		  length(N1,L1),
		  length(N2,L2),
		  L1 = L2,
		  \+(verificaMaggiore(N1,N2)),
		  reverse(N1,NRev1),
		  reverse(N2,NRev2),
		  differenza(NRev2,NRev1,DiffRev,0),
		  reverse(M,DiffRev),
		  togliZeri(M,N),
		  Segno= '-',!.

% caso ordine di grandezza differente (minore)
diff(N1,N2,N,Segno):-
		  length(N1,L1),
		  length(N2,L2),
		  L1 < L2,
		  reverse(N1,NRev1),
		  reverse(N2,NRev2),
		  differenza(NRev2,NRev1,DiffRev,0),
		  reverse(M,DiffRev),
		  togliZeri(M,N),
		  Segno = '-',!.
% caso base, ci arrivo nel caso N1=N2
verificaMaggiore([],[]).
verificaMaggiore([H1|_],[H2|_]):-
		  H1>H2.
verificaMaggiore([H1|T1],[H2|T2]):-
		  H1=:=H2,
		  verificaMaggiore(T1,T2).

% caso base stesso ordine di grandezza
differenza([],[],[],_).

% caso base diverso ordine di grandezza senza riporto finale
differenza(N1,[],N1,0).

% caso base diverso ordine di grandezza con riporto finale
differenza([H1|T1],[],[H1N|T1],1):-
		  H1N is H1 - 1.

% caso generale elemento maggiore
differenza([H1|T1],[H2|T2],[HD|TD],RiportoOld):-
		  HN is H1 - RiportoOld,
		  HN >= H2,
		  HD is HN - H2,
		  RiportoNew is 0,
		  differenza(T1,T2,TD,RiportoNew).

% caso generale elemento minore, eseguo riporto
differenza([H1|T1],[H2|T2],[HD|TD],RiportoOld):-
		  HN is H1 - RiportoOld,
		  HN < H2,
		  HNew is HN + 10,
		  HD is HNew - H2,
		  RiportoNew is 1,
		  differenza(T1,T2,TD,RiportoNew).

togliZeri([0|N],M):-
		  togliZeri(N,M).
togliZeri([H|N],[H|N]):-
		  H =\= 0.
