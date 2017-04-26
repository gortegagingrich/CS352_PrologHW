%% 1. isbefore/2
%% true if first arguent is lexically before second
isbefore(X,X).
isbefore(X,Y) :-
	X \== Y,
	atom(X),
	atom(Y),
	atom_codes(X,XX),
	atom_codes(Y,YY),
	isbefore(XX,YY).
isbefore([],[_|_]).
isbefore([X|_],[Y|_]) :-
	X < Y.
isbefore([X|XX], [X|YY]) :-
	isbefore(XX,YY).

%% 2. split/4
%% takes atom and list and returns two lists (less than atom, greater than or equal to atom)
split(A, L, X, Y) :-
	split2(A,L,[],[],X,Y).
	
split2(_,[],Lt,Geq,Lt,Geq).
split2(A,[H|T],Lt,Geq,X,Y) :-
	isbefore(H,A),
	split2(A,T,[H|Lt],Geq,X,Y).
split2(A,[H|T],Lt,Geq,X,Y) :-
	not(isbefore(H,A)),
	split2(A,T,Lt,[H|Geq],X,Y).

%% 3. qsort/2
%% second list is first list sorted using quicksort
%% use head as pivot
%% split list into smaller and bigger
%% recursively sort smaller and bigger
%% use append to put list back together with pivot in middle
qsort([],[]).
qsort([H],[H]).
qsort([H|T],Y) :-
	T \== [],
	split(H,T,Lo,Hi),
	qsort(Lo,Y1),
	qsort(Hi,Y2),
	append(Y1,[H|Y2],Y).

%% 4. term2list/2
term2list(Term, [Functor|Args]) :-
	functor(Term,Functor,Arity),
	getArgs(Arity,Arity,Term,[],Args).

getArgs(0,_,_,Acc,Acc).
getArgs(Index, Max, Term, Acc, Args) :-
	Index2 is Index - 1,
	arg(Index,Term,Arg),
	getArgs(Index2,Max,Term,[Arg|Acc],Args).

%% 5. flattener/2
flattener(X,Y) :-
	flatten(X,[],Y).

flatten([],Acc,Acc).
flatten([H|T],Acc,Y) :-
	atom(H),
	append(Acc,[H],Acc2),
	flatten(T,Acc2,Y).
flatten([[H|T1]|T2], Acc, Y) :-
	flatten([H|T1],[],Sublist),
	append(Acc,Sublist,Acc2),
	flatten(T2,Acc2,Y).

%% 6. hanoi/1

%% 7. a^n b^2n c^2n d^n language recognizer
s --> [a], s, [d].
s --> [a], b, [d].
b --> [b], [b], [c], [c].
b --> [b], [b], b, [c], [c].

%% 8. generate parse tree for previous grammar
ad(ad(AD)) --> [a], ad(AD), [d].
ad(BC) --> bc(BC).
bc(bc(BC)) --> [b], [b], bc(BC), [c], [c].
bc([]) --> []. 