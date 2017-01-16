go:-
		  read_input('input files/volo.txt',ListBooking),
		  splitConfirmedStandby(ListBooking,ListConf,ListStand),
		  write(ListBooking),nl,
		  write('LISTA DEI CONFERMATI'),nl,
		  msort(ListConf,ListConfSort),
		  printConfermati(ListConfSort),nl,
		  write('LISTA DEI NON CONFERMATI'),nl,
		  printStandby(ListStand,1),nl,
		  write('Dai il nominativo della persona che rinuncia: '),nl,
		  write('NOME: '),
		  read(X),nl,
		  write('COGNOME: '),
		  read(Y),nl,
		  aggiornaConfermati(Y,X,ListConf,NewConf,ListStand,NewStand),
		  sort(NewConf,NewConfSort),
		  write('NUOVA LISTA DEI CONFERMATI'),nl,
		  printConfermati(NewConfSort),nl,
		  write('NUOVA LISTA DEI NON CONFERMATI'),nl,
		  printStandby(NewStand,1).

/***OUTPUT a video***/

printConfermati([]).
printConfermati([volo(X,Y,_)|T]):-
		  write(X),tab(4),write(Y),nl,
		  printConfermati(T).

printStandby([],_).
printStandby([volo(X,Y,_)|T],N):-
		  write(X),tab(4),write(Y),tab(4),write(N),nl,
		  NNew is N + 1,
		  printStandby(T,NNew).


/***LOGICA***/

% divide l'elenco (lista) delle prenotazioni totali nelle due
% sottoliste: confermati e standby.
splitConfirmedStandby([],[],[]).

splitConfirmedStandby([volo(X,Y,1)|T1],[volo(Y,X,1)|TConfirmed],StandbyList):-
		  splitConfirmedStandby(T1,TConfirmed,StandbyList).

splitConfirmedStandby([volo(X,Y,0)|T1],ConfirmedList,[volo(Y,X,0)|TStandby]):-
		  splitConfirmedStandby(T1,ConfirmedList,TStandby).


% aggiorna l'elenco dei confermati eliminando l'elemento scelto e
% aggiungendovi la testa della lista degli elementi in standby
aggiornaConfermati(X,Y,ConfOld,ConfNew,[volo(M,N,0)|T],T):-
		  select(volo(X,Y,1),ConfOld,ConfTemp),
		  append(ConfTemp,[volo(M,N,1)],ConfNew).

/***FINE LOGICA***/


/***INPUT da file***/

% apre e chiude lo stream da file (non standard)
read_input(FILE,List):-
		  open(FILE,read,Str),
		  read_file(FILE,List,Str),
		  close(Str).

% assegna le varie clausole prese dal FILE come singoli elementi della
% lista (H)
read_file(_,[],Str):-
		  at_end_of_stream(Str).
read_file(FILE,[H|T],Str):-
		  \+(at_end_of_stream(Str)),
		  read(Str,H),
		  read_file(FILE,T,Str).
