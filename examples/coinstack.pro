/*
 * Esercizio presentato in data 18/10/2016
 * Risoluzione in PROLOG
 *
 * Si hanno 12 monete, poste in 3 pile distinte. Inizialmente nella
 * prima pila ci sono 7 monete, nella seconda 4, nella terza 1. Si tenga
 * presente che è possibile spostare delle monete dalla pila A alla pila
 * B, se e solo se, dopo lo spostamento, si avranno in B il doppio delle
 * monete.
 * Tenuto conto della regola per movimentare le monete da una pila
 * all'altra, si vuole ottenere una configurazione in cui le monete
 * siano equamente distribuite (4 monete per ogni pila).
 *
 * a) Descrivere lo spazio degli stati.
 * b) Descrivere lo stato iniziale e lo stato obiettivo.
 * c) Applicare l'algoritmo BFS e DLS fino al secondo livello di
 * profondità (risoluzione manuale: a parità di condizioni, si
 * preferiscono le mosse in cui l'indice dela pila sorgente è minore).
 * d) Indicare l'ordine di vista dei nodi dell'albero negli algoritmi.
 * e) Indicare dopo quanti passi viene trovata la soluzione.
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 Ilario Pierbattista
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

is_state(state(X,Y,Z)) :-
	X+Y+Z =:= 12,
	X >= 0,
	Y >= 0,
	Z >= 0.

legal_move(state(X1,Y1,Z), state(X2,Y2,Z)) :-
	is_state(state(X1,Y1,Z)),
	Y2 is Y1*2,
	X2 is X1 - Y1,
	is_state(state(X2,Y2,Z)).

legal_move(state(X1,Y,Z1), state(X2,Y,Z2)) :-
	is_state(state(X1,Y,Z1)),
	Z2 is Z1*2,
	X2 is X1 - Z1,
	is_state(state(X2,Y,Z2)).

legal_move(state(X1,Y1,Z), state(X2,Y2,Z)) :-
	is_state(state(X1,Y1,Z)),
	X2 is X1*2,
	Y2 is Y1 - X1,
	is_state(state(X2,Y2,Z)).

legal_move(state(X,Y1,Z1), state(X,Y2,Z2)) :-
	is_state(state(X,Y1,Z1)),
	Z2 is Z1*2,
	Y2 is Y1 - Z1,
	is_state(state(X,Y2,Z2)).

legal_move(state(X1,Y,Z1), state(X2,Y,Z2)) :-
	is_state(state(X1,Y,Z1)),
	X2 is X1*2,
	Z2 is Z1 - X1,
	is_state(state(X2,Y,Z2)).

legal_move(state(X,Y1,Z1), state(X,Y2,Z2)) :-
	is_state(state(X,Y1,Z1)),
	Y2 is Y1*2,
	Z2 is Z1 - Y1,
	is_state(state(X,Y2,Z2)).

goal_state(state(4,4,4)).


search_dfs(LastState, [LastState], MaxDepth) :-
	goal_state(LastState),
	MaxDepth >= 0.
search_dfs(PrevState, [PrevState|Solution], MaxDepth) :-
	MaxDepth >= 0,
	NextDepth is MaxDepth - 1,
	legal_move(PrevState, NextState),
	search_dfs(NextState, Solution, NextDepth).



























