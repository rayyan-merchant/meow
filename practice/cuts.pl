contains(X,[X|_]):-!.  %cannot backtrack once got here, meaning once conditions get true.
contains(X,[_|T]):- contains(X,T).

fact(a).
fact(b).
%fact(X),X=b. (true)
% fact(X),!,X=b. (false - since the first condition becomes
% true,itprevents then to backtrack when X is not equal to A
% fact(X),!,X=a. (true)



