%predicate 1

path(X,X,[X]).
path(X,Y,P) :-
	X \== Y,
	path2(X,Y,[],[],P).

path2(X, Y, Visited, Acc, P) :-
	X \== Y,
	notContains(X,Visited),
	doorExists(X,X2),
	append(Acc,[X],Acc2),
	path2(X2,Y,[X|Visited],Acc2, P).
path2(X, X, Visited, Acc, P) :-
	[H|T] = Visited,
	notContains(X,Acc),
	append(Acc, [X], P).

doorExists(X,Y) :-
	door(X,Y);
	door(Y,X).

notContains(_, []).
notContains(X, [H|T]) :-
	H \== X,
	notContains(X,T).

%predicate 2
noway(X,Y) :-
	not(path(X,Y,_)).

%predicate 3
redundant(X,Y).