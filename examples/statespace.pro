/*
 * Esempio sulla ricerca nello spazio degli stati.
 * Strategie di selezione non informate (DFS, BFS).
 */

/*
 * Database
 */
s(arad,zerind).
s(zerind,arad).
s(arad,sibiu).
s(arad,timisoara).
s(zerind,oradea).
s(oradea,sibiu).
s(timisoara,lugoj).
s(sibiu,fagaras).
s(sibiu,rimnicuVilcea).
s(lugoj,mehadia).
s(mehadia,dobreta).
s(dobreta,craiova).
s(rimnicuVilcea,craiova).
s(craiova,pitesti).
s(rimnicuVilcea,pitesti).
s(fagaras,bucharest).
s(pitesti,bucharest).
s(giurgiu,bucharest).
s(bucharest,urziceni).
s(urziceni,hirsova).
s(hirsova,eforie).
s(urziceni,vaslui).
s(vaslui,iasi).
s(iasi, neamt).
s(oradea,arad).

destination(bucharest).
