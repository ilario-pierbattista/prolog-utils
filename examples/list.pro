/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 Ilario Pierbattista, Melvin Mancini
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

/*
 * Reimplementing some basic predicates
 */

%% Last Element, recursive implementation
last_recursive(Element, [Element]).
last_recursive(Element, [_|Tail]) :- last_recursive(Element, Tail).

%% Even number of elements
even_elements([]).
even_elements([_,_|Tail]) :- even_elements(Tail).

%% Odd number of elements
odd_elements([_]).
odd_elements([_,_|Tail]) :- odd_elements(Tail).

/*
 * Test
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
:- end_tests(example_list).
