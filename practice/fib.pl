fib(0,0).
fib(1,1).
fib(N,R):-
    N>1,
    N1 is N-1,
    N2 is N-2,
    fib(N1,R1),fib(N2,R2),
    R is R1+R2.


fib_it(N,R):-
    fib_helper(N,1,0,R).

fib_helper(1,R,_,R).

fib_helper(N,FibN1,FibN2,R):-
    N>1,
    FibN1 is N-1,
    FibN is FibN1 + FibN2,
    fib_helper(N1,FibN,FibN1,R).


