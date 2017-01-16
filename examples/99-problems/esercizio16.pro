trova_posizione:-
		  write('Inserisci la lista: '),
		  read(L),
		  is_list(L),
		  inserisci_atomo(L).
inserisci_atomo(L):-
		  write('Inserisci l\'atomo da cercare: '),
		  read(A),
		  dif(A,'fine') ->
		  verifica_elemento(A,L),
		  inserisci_atomo(L);
		  true.
verifica_elemento(A,L):-
		  nth1(Index,L,A)->
		  write('L\'elemento '),
		  write(A),
		  write(' è in '),
		  write(Index),
		  write(' posizione.'),
		  nl;
		  write('L\' elemento '),
		  write(A),
		  write(' non è presente.'),
		  nl,
		  true.
