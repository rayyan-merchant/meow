fact(0,1).

fact(N,F):-
    N1 is N-1,
    fact(N1,F1),
    F is F1*N.



fact_it(N,F):-
    factorial_helper(0,N,1,F).

factorial_helper(N,N,F,F).

factorial_helper(I,N,T,F):-
    I<N,
    I1 is I+1,
    T1 is T*I1,
    factorial_helper(I1,N,T1,F).

