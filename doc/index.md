# Prolog

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Prolog](#prolog)
	- [Sintassi e semantica](#sintassi-e-semantica)
		- [Data Object](#data-object)
			- [Atomi](#atomi)
			- [Numeri](#numeri)
			- [Variabili](#variabili)
			- [Strutture](#strutture)
		- [Intepretazione programmi Prolog](#intepretazione-programmi-prolog)
	- [Liste, operatori e aritmetica](#liste-operatori-e-aritmetica)
		- [Liste](#liste)
			- [Predicati fondamentali](#predicati-fondamentali)
		- [Operatori](#operatori)
			- [Priorità](#priorit)
			- [Prefissi](#prefissi)
			- [Postfissi](#postfissi)
			- [Infissi](#infissi)
			- [Definizione](#definizione)
			- [Operatori aritmetici predefiniti](#operatori-aritmetici-predefiniti)

<!-- /TOC -->

## Sintassi e semantica
### Data Object
Gli oggetti rappresentabili in Prolog si dividono sostanzialmente in due macro categorie:

* Oggetti semplici
  - Costanti
    * Atomi
    * Numeri
  - Variabili
* Oggetti strutturati (Strutture)

#### Atomi
Gli atomi possono essere espressi nella seguente maniera:
1. Stringhe di lettere, numeri e `_` che iniziano con un carattere minuscolo. Esempio: `x15, alpha_beta_gamma, taxi_35`
2. Stringhe di caratteri speciali, i quali hanno significato speciale in Prolog. Esempio: `---> <==> < > . :-- ++`
3. Stringhe in apici singoli. Esempio: `X_35, Peter, Britney Spears`

#### Numeri
Il linguaggio è dichiaritivo e non ha tipi di dato, tuttavia, quando tratta i numeri, i quali verranni elaborati da funzioni in C, le tipizza in due tipi:

* Interi `1, 24, -55`
* Float `3.14, -0.0045, 1.34E-21`

#### Variabili
Stringhe di lettere, numeri e underscore che iniziano con un carattere maiuscolo. Esempio: `X, X_ciao, Participant_list`
Il carattere di `_` indica una variabile anonima.

#### Strutture
In Prolog le strutture sono oggetti che hanno diversi componenti.

```
date(17, june, 2016)
```

* `date` prende il nome di **funtore**, ovvero quello che in un linguaggio tradizionale chiameremmo il *simbolo di funzione*. Il nome del funtore viene espresso mediante un *atomo*.
* `17, june, 2016` sono gli **argomenti**. Il *numero* di argomenti prende il nome di **arità** della funzione (in questo caso è 3). Gli argomenti non devono essere necessariamente costanti.

Le strutture dati in Prolog non sono altro che **termini della logica del primo ordine**, perchè non fanno altro che rappresentare oggetti del dominio di interesse.

Tutti gli oggetti strutturati in Prolog possono essere visti come **alberi** e l'albero è anche l'unico modo per costruire oggetti strutturati in Prolog.


### Intepretazione programmi Prolog
Consideriamo la clausola: `P :- Q,R`, possiamo fornire due interpretazioni:

* **interpretazione dichiarativa**: P è vera, se Q e R sono vere
* **interpretazione procedurale**: per risolvere il problema P, prima risolvi il *sottoproblema* Q e *poi* il sottoproblema R. Questa interpretazione ci fa capire l'importanza dell'ordine



## Liste, operatori e aritmetica
### Liste
La lista in Prolog è una struttura, definita ricorsivamente, che viene caratterizzata da due elementi:
* una **testa**
* una **coda**, che non è altro che una lista anch'essa.
Il **funtore** standard della lista è il `.`, mentre l'identificatore di lista vuota è l'atomo `nil`

Detto questo, se volessimo rappresentare una generica lista di questo tipo:
```
lista(mario, padre_di(mario), punto(1,2), gatto)
```
in Prolog sarebbe da scriversi così:
```
.(mario, .(padre_di(mario), .(punto(1,2), .(gatto, nil))))
```
Tuttavia, essendo questa notazione particolarmente verbosa, il Prolog prevede del *syntax sugar* permettendo l'utilizzo delle parentesi `[]`:
```
[mario, padre_di(mario), punto(1,2), gatto]
```
Inoltre, un'altra rappresentazione ancora è quella tramite l'utilizzo del pipe `|` per destrutturare la lista in testa e coda: `[Testa|Coda]`:
```
[Head|Tail] = [a, b, c, d]
-> Head = a
-> Tail = [b, c, d]
```
#### Predicati fondamentali
* `member(X,L)`[**built-in**] X è un membro della lista L
* `append(L1,L2,L3)`[**built-in**] L3 è la lista generata appendendo la lista L2 alla lista L1
* `del(X,L,NewL)` Cancella l'elemento X dalla lista L e ottieni la nuova lista NewL
* `insert(X,L,NewL)` Inserisce l'elemento X nella lista L per ottenere la nuova lista NewL. L'inserimento è non deterministico, ovvero non so in quale posizione della lista verrà inserito l'elemento
* `sublist(S,L)` Ricava la sottolista S dalla lista L
* `permutazione(L, NewL)` Permuta gli elementi della lista L ritornandoli nella lista NewL

### Operatori
La sintassi del Prolog prevede tre categorie di **operatori** `f`:

* **prefissi** (unario)
* **postfissi** (unario)
* **infissi** (binario): la posizione dell'operatore è sempre tra i due argomenti della struttura

#### Priorità
Per evitare ambiguità, viene associata una **priorità** agli operatori che rientra nel range `1-1200`, dove a numeri più piccoli corrisponde una priorità maggiore.
Normalmente, la precedenza maggiore la hanno sempre:
* gli atomi
* le espressioni tra parentesi `()`
Esempio:
```
-(a, *(b,c))
Senza prorità degli operatori avrei l'ambiguià dei due risultati:
--> (a-b)*c
--> a-(b*c)
```

#### Prefissi
* `fx`: l'espressione `x` che segue l'operatore `f` deve avere priorità strettamente minore di `f`
* `fy`: l'espressione `y` che segue l'operatore `f` può avere una precedenza anche pari a quella dell'operatore

**Esempio**: Supponiamo di definire l'operatore `not`, se il tipo è:
* `fy`, allora una scrittura `not not G` è permessa
* `fx`, allora una scrittura `not not G` non è permessa, ma per ottenere lo stesso risultato dovrei scrivere `not (not G)`

#### Postfissi
* `xf`: l'espressione `x` che precede l'operatore `f` deve avere priorità strettamente minore di `f`
* `yf`: l'espressioen `y` che precede l'operatore `f` può avere un precedenza anche pari a quella dell'operatore

#### Infissi
* `yfx`: associatività a sinistra
* `xfy`: associatività a destra
* `xfx`: l'operatore non è associativo

**Esempio**: <br/>
Supponiamo di aver definito gli operatori `+` e `-` del tipo `yfx` (cioè associativi a sinistra), allora avremmo che `a-b+c -> (a-b)+c`

#### Definizione
La definizione di un operatore in Prolog avviene mediante questa **direttiva**:
```
:- op(P,T,N)
```
dove:
* **P** è la priorità
* **T** + la categoria
* **N** è il funtore

**Esempio**: `:- op(1050,xfy, ->).` <br/>
**Esempio**: <br/>
Vediamo come possiamo ridefinire l'operatore `member(X,L)` delle liste:
```
:- op(100, xfx, 'si trova in').

Elemento 'si trova in' [Testa|_].
Elemento 'si trova in' [_|Coda] :- Elemento 'si trova in' Coda.
```
