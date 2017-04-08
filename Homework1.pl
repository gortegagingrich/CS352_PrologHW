isList([]).
isList(X) :- [_|_]=X.

prepend([],B,X) :- B=X.
prepend(A,B,X) :- [A|B]=X.

remove(_,[],[]).
remove(A,[A|T],T).
remove(A,[H|T],[H|X]) :- remove(A,T,X).

filter(_,[],[]).
filter(A,[A|T],R) :- filter(A,T,R).
filter(A,[H|T],[H|X]) :- filter(A,T,X).

frenchFlag(A, X) :- getAs(r,A,[],R), getAs(w,A,R,W), getAs(b,A,W,X).
getAs(A,[A|T],Acc,X) :- getAs(A,T,[A|Acc],X).
getAs(A,[_|T],Acc,X) :- getAs(A,T,Acc,X).
getAs(_,[],Acc,Acc).