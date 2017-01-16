/* QUADRATI MAGICI */
/* funziona ma non è efficiente per niente*/
valore(1).
valore(2).
valore(3).
valore(4).
valore(5).
valore(6).
valore(7).
valore(8).
valore(9).

quadrati_magici(L):-
		  valore(A1),
		  valore(A2),
		  valore(A3),
		  valore(A4),
		  valore(A5),
		  valore(A6),
		  valore(A7),
		  valore(A8),
		  valore(A9),
		  A1=\=A2,
		  A1=\=A3,
		  A1=\=A4,
		  A1=\=A5,
		  A1=\=A6,
		  A1=\=A7,
		  A1=\=A8,
		  A1=\=A9,
		  A2=\=A3,
		  A2=\=A4,
		  A2=\=A5,
		  A2=\=A6,
		  A2=\=A7,
		  A2=\=A8,
		  A2=\=A9,
		  A3=\=A4,
		  A3=\=A5,
		  A3=\=A6,
		  A3=\=A7,
		  A3=\=A8,
		  A3=\=A9,
		  A4=\=A5,
		  A4=\=A6,
		  A4=\=A7,
		  A4=\=A8,
		  A4=\=A9,
		  A5=\=A6,
		  A5=\=A7,
		  A5=\=A8,
		  A5=\=A9,
		  A6=\=A7,
		  A6=\=A8,
		  A6=\=A9,
		  A7=\=A8,
		  A7=\=A9,
		  A8=\=A9,
		  somma(A1,A2,A3,H1),
		  somma(A4,A5,A6,H2),
		  somma(A7,A8,A9,H3),
		  somma(A1,A4,A7,V1),
		  somma(A2,A5,A8,V2),
		  somma(A3,A6,A9,V3),
		  somma(A1,A5,A9,D1),
		  somma(A3,A5,A7,D2),
		  H1=:=H2,
		  H2=:=H3,
		  H3=:=V1,
		  V1=:=V2,
		  V2=:=V3,
		  V3=:=D1,
		  D1=:=D2,
		  L = [[A1,A2,A3],[A4,A5,A6],[A7,A8,A9]].

somma(V1,V2,V3,Sum):-
		  S is V1+V2,
		  Sum is S+V3.
