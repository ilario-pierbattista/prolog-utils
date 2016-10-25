/*
 * Rappresentazione in prolog di una rete semantica
 * [25/10/2016]
 */

isa(mammifero, persona).
isa(persona, femmina).
isa(persona, maschio).
isa(maschio, giovanni).
comeNutreCuccioli(mammifero, allatta).

fatto(Fatto) :-
	Fatto,
	!.
fatto(Fatto) :-
	Fatto =.. [Relazione, Arg1, Arg2],
	isa(SuperArg, Arg1),
	SuperFatto =.. [Relazione, SuperArg, Arg2],
	fatto(SuperFatto).













