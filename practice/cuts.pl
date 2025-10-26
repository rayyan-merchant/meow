contains(X,[X|_]):-!.  %cannot backtrack once got here, meaning once conditions get true.
contains(X,[_|T]):- contains(X,T).

fact(a).
fact(b).
%fact(X),X=b. (true)
% fact(X),!,X=b. (false - since the first condition becomes
% true,itprevents then to backtrack when X is not equal to A
% fact(X),!,X=a. (true)



has(bob,phone).
has(alice,keys).
has(alice,wallets).

ready(X):-prepared(X).
prepared(X):-has(X,phone),!,has(X,keys),has(X,wallet).
prepared(X):-has(_,phone),!,has(_,keys),has(_,wallet). %this rule should always be true acc to our knowledge base but will never be used because of cut.
