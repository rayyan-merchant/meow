solve_kakuro(Grid):-
    extract_variables(Grid, Vars), assign_digits(Vars),
    check_row_sums(Grid), check_col_sums(Grid).

assign_digits([]).

assign_digits([V|Vs]):- between(1, 9, V), assign_digits(Vs).


% Assign digits between 1 and 9 to each variable
check_row_sums(Row, Sum):-
    sum_list(Row, Sum), all_different(Row).


check_col_sums(Grid):-
    transpose(Grid, TransposedGrid), check_row_sums(TransposedGrid).


/*
- Read the grid in row-wise format like grid([[ K, 16, 10], [17, A, B],[9, C, D]])
- Extract all the variables(A, B, C, D) from the grid
- For each row, find the sum constraint(first cell) and the variables
in that row
- Assign digits 1-9 to each variable using between/3
- Check if the sum matches the constraint in the first cell
- Make sure no digits repeat in the same row
- Do the same thing for columns by transposing the grid
- If all constraints are satisfied, we found the solution


*/

