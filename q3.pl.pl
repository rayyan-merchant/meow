% get_cell: true if Val is the element at row R, col C
get_cell(Grid, R, C, Val) :-
    nth0(R, Grid, Row), nth0(C, Row, Val).

% left_value: LVal is value of cell to the left of (R,C).
% if left is out of bounds, treat as 0(water).
left_value(Grid, R, C, LVal) :- C1 is C - 1,
    (C1 < 0 -> LVal = 0;
    get_cell(Grid, R, C1, LVal)).


% Logic: scan row by row and if current cell is 1 and left cell is 0 then it's a new island.
count_islands(Grid, Count) :-
    length(Grid, Rows),
    nth0(0, Grid, FirstRow), length(FirstRow, Cols),
    count_cells(Grid, 0, 0, Rows, Cols, 0, Count).


% count_cells(Grid, R, C, Rows, Cols, Acc, Count)
count_cells(_, R, _, Rows, _, Acc, Acc) :-
    R >= Rows, !.

count_cells(Grid, R, C, Rows, Cols, Acc, Count) :-
    C >= Cols, !, R1 is R + 1,
    count_cells(Grid, R1, 0, Rows, Cols, Acc, Count).

count_cells(Grid, R, C, Rows, Cols, Acc, Count) :-
    (get_cell(Grid, R, C, V), V =:= 1 ->
        left_value(Grid, R, C, L),
        (L =:= 0 -> Acc1 is Acc + 1 ; Acc1 is Acc );
    Acc1 is Acc),
    C1 is C + 1,
    count_cells(Grid, R, C1, Rows, Cols, Acc1, Count).


% took help from AI to understand the logic. But still the code has bugs

% Logic Explained:
/*
 - I loop through every cell row by row.
 - For each cell if it is '1' (land) then I check only the cell on its left.
 - If the left cell is 0 (or out of bounds), I assume this is the start of a new island and increment the counter.

The program scans the grid row by row and cell by cell. Whenever it
finds a land cell(1), it checks the cell immediately to its left.If the
left cell is water(0) or does not exist(start of the row), it counts
this as the beginning of a new island and increases the island counter.
The overall count represents how many separate land segments appear
horizontally in the grid.


*/
