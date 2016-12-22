% Esercizio 6
% Sistemare parole in un cruciverba.

% Database fatti (parole)
word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

% In questo caso non succede, ma nulla vieta a una parola di comparire più volte
% ?- cruciverba(H1,H2,H3,V1,V2,V3).
% H1=abalone, H2=anagram, H3=connect, V1=abandon, V2=elegant, V3=enhance ;
% H1=abandon, H2=elegant, H3=enhance, V1=abalone, V2=anagram, V3=connect
cruciverba(H1,H2,H3,V1,V2,V3):-
 	word(H1, _, A1, _, A2, _, A3, _),
 	word(H2, _, A4, _, A5, _, A6, _),
 	word(H3, _, A7, _, A8, _, A9, _),
    word(V1, _, A1, _, A4, _, A7, _),
 	word(V2, _, A2, _, A5, _, A8, _),
 	word(V3, _, A3, _, A6, _, A9, _).
    