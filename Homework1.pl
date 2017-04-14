%Ex 1: return true if argument is list and false otherwise
isList([]).
isList([_|_]).

%Ex 2: prepend first argument to second argument
prepend(A,B,[A|B]) :-
	isList(B).

%Ex 3: remove first instance of first argument from second argument
remove(_,[],[]).
remove(A,[A|T],T).
remove(A,[H|T],[H|X]) :-
	H \== A,
	remove(A,T,X).

%Ex 4: remove all instances of first argument from second argument
filter(_,[],[]).
filter(A,[A|T],R) :-
	filter(A,T,R).
filter(A,[H|T],[H|X]) :-
	filter(A,T,X),
	H \== A.

%Ex 5: group and return all b, w, and r in first argument
frenchFlag(A, X) :-
	flag(A,[],[],X).

flag([], Acc1, Acc2, X) :-
	append(Acc1, Acc2, X).
flag([H|T], Acc1, Acc2, X) :-
	H=b,
	flag(T,[b|Acc1],Acc2,X).
flag([H|T], Acc1, Acc2, X) :-
	H=w,
	append(Acc1,[w],Acc3),
	flag(T, Acc3, Acc2, X).
flag([H|T], Acc1, Acc2, X) :-
	H=r,
	flag(T, Acc1, [r|Acc2], X).
flag([H|T], Acc1, Acc2, X) :-
	H \== b,
	H \== w,
	H \== r,
	flag(T, Acc1, Acc2, X).