find_element_index(Element, List, Index) :-
    find_element_index(Element, List, 0, Index).

find_element_index(Element, [Element|_], Index, Index) :- !.
find_element_index(Element, [_|Tail], Counter, Index) :-
    Next is Counter + 1,
    find_element_index(Element, Tail, Next, Index).
