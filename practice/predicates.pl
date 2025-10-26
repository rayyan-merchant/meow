contains(X,[X|_]).
contains(X,[_|T]):- contains(X,T).


len([],0).
len([_|T],N):-len(T,M), N is M+1.


join([],L,L).
join([H|T1],L2,[H|T3]) :- join(T1,L2,T3).

%join([1,2,3],[a,b,c],R).
%join([1,2,3],Y,[1,2,3,a,b,c]).
%join(_,[a|_],[1,2,3,a,b,c]).


del_first(X,[X|T],T).

del_first(X,[H|T],[H|R]):-
          X\=H,
          del_first(X,T,R).


del(X,[X|T],T).

del(X,[H|T],[H|R]):-
          del(X,T,R).



subset([],_).
subset([H|T],R):-
    del(H,R,R1),
    subset(T,R1).




mySort([],[]).
mySort([H|T],Result) :-
    mySort(T,SortedTail),
    insert(H,SortedTail,Result).


insert(X,[],[X]).
insert(X,[H|T],[X,H|T]):- X=<H.
insert(X,[H|T],[H|R]):-
    X > H,
    insert(X,T,R).




mySortDesc([], []).
mySortDesc([H|T], Result) :-
    mySortDesc(T, SortedTail),
    insertDesc(H, SortedTail, Result).

insertDesc(X, [], [X]).
insertDesc(X, [H|T], [X,H|T]) :- X >= H.
insertDesc(X, [H|T], [H|R]) :-
    X < H,
    insertDesc(X, T, R).




maximum([X],X).
maximum([H|T],R):-
    maximum(T,MaxTail),
    (H >= MaxTail -> R=H; R=MaxTail).




even_list([]).
even_list([_,_]).
even_list([_,_|T]):- even_list(T).


all_even([]).
all_even([H|T]):-
         Rem is H mod 2, Rem =:= 0,
         all_even(T).



sum([],0).
sum([H|T],S):-
    number(H),
    sum(T,S1),
    S is S1+H.



%mapping
scale(_,[],[]).
scale(X,[H|T],[H1|R]):-
    H1 is X*H,
    scale(X,T,R).


%general purpose mapping
square(X,X2):- X2 is X*X.  %example

map(_,[],[]).
map(F,[H|T],[X|R]):-
    call(F,H,X),
    map(F,T,R).


