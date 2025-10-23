set_member(X, [X|_]).
set_member(X, [_|T]) :- set_member(X,T).


set_union([], S,S).
set_union([H|T], S2, S):-
set_member(H,S2), !, set_union(T,S2,S).
set_union([H|T], S2, [H|S]) :- set_union(T,S2,S).


set_intersection([], _, []).
set_intersection([H|T], S2, [H|S]):-
set_member(H,S2), !, set_intersection(T,S2, S).
set_intersection([_|T], S2, S):- set_intersection(T,S2,S).


:- op(700,xfy,u).
:- op(700,xfy,n).

A u B :- set_union(A,B,S), write(S).
A n B :- set_intersection(A,B,S), write(S).




set_cardinality([],0).
set_cardinality([_|T],N) :- set_cardinality(T,N1), N is N1+1.


set_difference([],_,[]).
set_difference([H|T],S2,S):- set_member(H,S2), !, set_difference(T,S2,S).
set_difference([H|T], S2, [H|S]) :- set_difference(T,S2,S).

