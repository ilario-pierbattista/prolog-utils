% Esercizio 7
% Crivello di Eratostene: scrivere tutti i numeri primi minori o uguali a N

% Il procedimento è il seguente: si scrivono tutti i naturali a partire da 2
% fino ad n in un elenco detto setaccio. Poi si cancellano (setacciano) tutti
% i multipli del primo numero del setaccio (escluso lui stesso). Si prosegue
% così fino ad arrivare in fondo. I numeri che restano sono i numeri primi minori
% od uguali a n. È come se si utilizzassero dei se­tacci a maglie via via più larghe:
% il primo lascia passare solo i multipli di 2, il secondo solo i multipli di 3, e così via.


% Restituisce la lista di tutti i numeri primi fino a N
% ?- primi(30,L).
% L = [2,3,5,7,11,13,17,19,23,29]
primi(UpperBound, PrimeList) :-
	numbers(UpperBound, NumberList),
	eratostene(NumberList, PrimeList).

% Estrae la lista dei numeri primi dalla lista incrementale di numeri
% Predicato lanciatore
eratostene(NumberList, Solution) :-
	% Inizializzazione della lista di primi trovati con una lista vuota
	eratostene(NumberList, [], Solution).

% Caso base
eratostene([], PrimeList, PrimeList).
% Caso induttivo:
% Il primo elemento della lista dei numeri sarà un numero primo.
% Diventarà quindi l'elemento i cui multipli dovranno essere esclusi
% dal resto della lista
eratostene([Prime|NumberList], PrimeList, Solution) :-
	% Estrazione della lista di numeri coprimi con Prime
	findall(N,
		coprimeList(Prime, NumberList, N),
		FilteredList),
	% Aggiunta del numero primo alla lista della soluzione parziale
	append(PrimeList, [Prime], NextPrimeList),
	% Riesecuzione del crivello di eratostene sulla lista filtrata
	eratostene(FilteredList, NextPrimeList, Solution).

% Predicato per il controllo che N, membro di NumberList,
% NON sia divisibile per Prime
coprimeList(Prime, NumberList, N) :-
	member(N, NumberList),
	mod(N, Prime) =\= 0.

% Genera una lista di numeri da 2 a Count
numbers(Count, List) :-
    findall(N, between(2,Count,N), List).


/*---------------------------------------------
 * TEST
 *---------------------------------------------
 */
:- begin_tests(esercizio07).
test(eratostene) :-
	L = [2,3,5,7,11,13,17,19,23,29],
	N = 30,

	primi(N,L).
:- end_tests(esercizio07).

