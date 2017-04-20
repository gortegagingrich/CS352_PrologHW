%predicate 1
path(X,X,[]).
path(X,Y,P) :-
	path2(X,Y,[],[],P1),
	reverse(P1,[],P).

path2(X, X, _, Acc, [X|Acc]).
path2(X, Y, Visited, Acc, P) :-
	X \== Y,
	notContains(X,Visited),
	doorExists(X,X2),
	path2(X2,Y,[X|Visited],[X|Acc], P).


doorExists(X,Y) :-
	door(X,Y);
	door(Y,X).

notContains(_, []).
notContains(X, [H|T]) :-
	H \== X,
	notContains(X,T).

reverse([], Acc, Acc).
reverse([H|T], Acc, X) :-
	reverse(T,[H|Acc], X).