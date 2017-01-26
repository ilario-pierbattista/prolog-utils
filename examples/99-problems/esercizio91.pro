/* Colorazione mappa senza usare CLP */


color(red).
color(yellow).
color(blue).
color(white).

n(red,yellow).
n(red,blue).
n(red,white).
n(yellow,red).
n(yellow,blue).
n(yellow,white).
n(blue,red).
n(blue,yellow).
n(blue,white).
n(white,red).
n(white,yellow).
n(white,blue).

test_color(A,B,C,D,E,F):-
		  n(A,B),n(A,C),n(A,D),n(A,E),n(A,F),
		  n(B,C),n(B,D),n(B,E),n(B,F),
		  n(C,D),
		  n(E,F),
		  write('La regione a viene colorata di '),
		  write(A),nl,
		  write('La regione b viene colorata di '),
		  write(B),nl,
		  write('La regione c viene colorata di '),
		  write(C),nl,
		  write('La regione d viene colorata di '),
		  write(D),nl,
		  write('La regione e viene colorata di '),
		  write(E),nl,
		  write('La regione f viene colorata di '),
		  write(F).
