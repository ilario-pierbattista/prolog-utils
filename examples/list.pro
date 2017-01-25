/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 Ilario Pierbattista, Melvin Mancini
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

%!	last_recursive(+Element: atom, +List: list) is semidet.
% Controlla che Element sia l'ultimo elemento di List.

%!	last_recursive(-Element: atom, +List: list) is nondet.
% Cerca l'ultimo elemento della lista.
last_recursive(Element, [Element]).
last_recursive(Element, [_|Tail]) :-
	last_recursive(Element, Tail).

%!	even_elements(+List: list) is semidet.
% Controlla che il numero di elementi di List sia pari.
even_elements([]).
even_elements([_,_|Tail]) :- even_elements(Tail).

%!	odd_elements(+List: list) is semidet.
% Controlla che il numero di elementi di List sia dispari.
odd_elements([_]).
odd_elements([_,_|Tail]) :- odd_elements(Tail).

%!	is_a_list(+List: list) is det.
% Verifica che List sia effettivamente una lista.
is_a_list([]).
is_a_list([_|Tail]) :-
	is_a_list(Tail).

%!	list_length_rec(+List: list, +Length: int) is semidet.
% Controlla che il numero di elementi di List sia pari al Length.
% Implementata con la ricorsione. [17/10/16]

%!	list_length_rec(+List: list, -Length: int) is nondet.
% Conta il numero di elementi di List. Implementatta con la ricorsione.
% [17/10/16]
list_length_rec([], 0).
list_length_rec([_|Tail], Length) :-
	list_length_rec(Tail, LengthTail),
	Length is LengthTail+1.

%!	list_length_acc(+List: list, +Length: int) is semidet.
% Controlla che il numero di elementi di List sia pari a Lenght.
% Implementazione ricorsiva con accumulatori. [17/10/16]

%!	list_length_acc(+List: list, -Length: int) is nondet.
% Calcola il numero di elementi di List. Implementazione ricorsiva con
% accumulatori. [17/10/16]
list_length_acc(List, Length) :-                   % Lanciatore del predicato
	list_length_acc(List, 0, Length).
list_length_acc([], Accumulator, Accumulator).	   % Caso base
list_length_acc([_|Tail], CurrentAcc, Length) :-   % Caso induttivo
	IncrementedAcc is CurrentAcc+1,
	list_length_acc(Tail, IncrementedAcc, Length).

%%	List Append con accumulatore
% 17/10/2016
% @TODO

%!	list_prefix(+Prefix: list, +List: list) is semidet.
% Controlla che Prefix sia il prefisso di List. [17/10/16]

%!	list_prefix(-Prefix: list, +List: list) is nondet.
% Cerca i prefissi (Prefix) di List. [17/10/16]
list_prefix(Prefix, List) :-
	append(Prefix, _, List).

%!	list_suffix(+Suffix: list, +List: list) is semidet.
% Controlla che Suffix sia un suffisso di List. [17/10/16]

%!	list_suffix(-Suffix: list, +List: list) is nondet.
% Cerca i suffissi (Suffix) di List. [17/10/16]
list_suffix(Suffix, List) :-
	append(_, Suffix, List).

/* ----------------------------------
 * Test
 * ----------------------------------
 */
:- begin_tests(example_list).
test(last) :-
	L1 = [1],
	L2 = [1,2,3],

	assertion(last_recursive(1, L1)),
	assertion(last_recursive(3, L2)),
	assertion(not(last_recursive(3, L1))),
	assertion(not(last_recursive(2, L2))),
	assertion(not(last_recursive(1, [])))
	.

test(odd_even) :-
	LE = [1,3,4,5],
	LO = [4,5,6],

	assertion(even_elements([])),
	assertion(even_elements(LE)),
	assertion(not(even_elements(LO))),
	assertion(not(odd_elements([]))),
	assertion(not(odd_elements(LE))),
	assertion(odd_elements(LO))
	.

test(is_a_list) :-
	assertion(is_a_list([])),
	assertion(is_a_list([1,2,3,4])),
	assertion(not(is_a_list(aldo))),
	assertion(not(is_a_list(10)))
	.

test(get_length) :-
	L1 = [1],
	L2 = [1,2,3],

	assertion(list_length_rec([], 0)),
	assertion(list_length_acc([], 0)),
	assertion(list_length_rec(L1, 1)),
	assertion(list_length_acc(L1, 1)),
	assertion(list_length_rec(L2, 3)),
	assertion(list_length_acc(L2, 3))
	.
:- end_tests(example_list).
