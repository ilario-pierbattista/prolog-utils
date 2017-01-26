/* SOMME */

somme(List,Sums):-
		  reverse(List,Rev),
		  length(Rev,Length),
		  sum0(Rev,Sums,Length,1).

sum0(_,[],L,N):-
		  N>L.
sum0(List,[HSum|TSums],L,N):-
		  N=<L,
		  sum1(List,0,N,HSum),
		  NNew is N+1,
		  sum0(List,TSums,L,NNew).

sum1(_,SumFinal,0,SumFinal).
sum1([H|T],Sum,N,SumFinal):-
		  N>0,
		  SumNew is Sum + H,
		  NNew is N-1,
		  sum1(T,SumNew,NNew,SumFinal).
