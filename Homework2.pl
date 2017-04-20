%predicate 1
path(X,X,[]).
path(X,Y,P) :-
	path2(X,Y,[],P).

path2(X, X, Acc, Acc).
path2(X, Y, Acc, P) :-
	X \== Y,
	doorExists(X,X2),
	notContains(X2, P),
	path2(X2,Y,[X|Acc],P).

doorExists(X,Y) :-
	door(X,Y);
	door(Y,X).

notContains(_, []).
notContains(X, [H|T]) :-
	H \== X,
	notContains(X,T).