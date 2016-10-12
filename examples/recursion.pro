/*
 * Esercizi in aula 12/10/2016
 */

% Calcolo della lunghezza di una lista
% list_length(List, Length)
list_length([], 0).
list_length([_|Tail], Length) :-
	list_length(Tail, Length),
	Length is Length + 1.

% Uso degli accumulatori
% list_len_acc(List, Accumulator, Output)
list_len_acc([], Acc, Acc).
list_len_acc([_|Tail], Acc, Out) :-
	Acc1 is Acc+1,
	list_len_acc(Tail, Acc1, Out).

% Unit test dell'esercizio
:- begin_tests(exercises_recursion).
text(list_len) :-
	L1 = [1,3,4,5,7,8],
	L2 = [1,2,4],

	assertion(list_length([], 0)),
	assertion(list_length(L1, 6)),
	assertion(list_length(L2, 3)),
	assertion(list_len_acc([], 0)),
	assertion(list_len_acc(L1, 6)),
	assertion(list_len_acc(L2, 3))
	.
:- end_tests(exercises_recursion).
