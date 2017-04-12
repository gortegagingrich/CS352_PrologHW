isList([_|_]).

prepend(A,B,[A|B]).

remove(_,[],[]).
remove(A,[A|T],T) :- !.
remove(A,[H|T],[H|X]) :-
	remove(A,T,X), !.

filter(_,[],[]).
filter(A,[A|T],R) :-
	filter(A,T,R),
	!.
filter(A,[H|T],[H|X]) :-
	filter(A,T,X),
	!.

frenchFlag(A, X) :-
	flag(A,[],[],[],X),
	!.

flag([], Acc1, Acc2, Acc3, X) :-
	append(Acc1,Acc2,X0),
	append(X0,Acc3,X).
flag([H|T], Acc1, Acc2, Acc3,X) :-
	H=b,
	flag(T, [H|Acc1], Acc2, Acc3, X).
flag([H|T], Acc1, Acc2, Acc3, X) :-
	H=w,
	flag(T, Acc1, [H|Acc2], Acc3, X).
flag([H|T], Acc1, Acc2, Acc3, X) :-
	H=r,
	flag(T, Acc1, Acc2, [H|Acc3],X).
flag([_|T], Acc1, Acc2, Acc3, X) :-
	flag(T, Acc1, Acc2, Acc3, X).
