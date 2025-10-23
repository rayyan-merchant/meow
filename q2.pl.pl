% assigning each roman symbol its numeric value
set(i, 1).
set(v, 5).
set(x, 10).
set(l, 50).
set(c, 100).
set(d, 500).
set(m ,1000).


roman_value([], 0). % if list is empty

roman_value(S,V):-set(S,V).  %if list has one symbol



isValid([]).   %empty list, isValid
isValid([_]).  %single element, hence valid
isValid([A,A,A,A | _]) :- !, fail.   %invalid, since 4 elements repeating
isValid([_|T]) :- isValid(T).


decimal_value([],0).  %empty list
decimal_value([H],V):-roman_value(H,V).   %single element

decimal_value([H1, H2 | T], V) :-
    isValid([H1, H2 | T]),   %first, check if list is valid
    roman_value(H1, V1),     % get value of first symbol
    roman_value(H2, V2),     % get value of second symbol
    decimal_value([H2 | T], RV),   %recursivly find rest of the values
    (V1 >= V2 -> V is V1 + RV;
    V is RV - V1).
