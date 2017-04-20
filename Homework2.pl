%predicate 1
path(X,X,[]).
path(X,Y,P) :-
	X =\= Y,
	(
		door(X,X2);
		door(X2,X)
	),
	notContains(X2,P),
	path(X2,Y,[X|P]).

notContains(X, []).
notContains(X, [H|T]) :-
	H =\= X,
	notContains(X,T).