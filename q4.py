from itertools import permutations

def solve_kakuro(grid):
    # Extract row and column constraints
    top = grid[0][1:]  # top sums for columns
    left = [row[0] for row in grid[1:]]  # left sums for rows
    n_rows = len(left)
    n_cols = len(top)
    
    # Empty grid to fill
    board = [[0]*n_cols for _ in range(n_rows)]
    
    digits = [1,2,3,4,5,6,7,8,9]

    # Helper: check if current grid is valid
    def valid():
        # Check row sums (only if no zeroes)
        for i in range(n_rows):
            row_vals = board[i]
            if 0 not in row_vals and sum(row_vals) != left[i]:
                return False
            # No duplicates in row
            if len(set([x for x in row_vals if x != 0])) != len([x for x in row_vals if x != 0]):
                return False
        
        # Check column sums
        for j in range(n_cols):
            col_vals = [board[i][j] for i in range(n_rows)]
            if 0 not in col_vals and sum(col_vals) != top[j]:
                return False
            # No duplicates in column
            if len(set([x for x in col_vals if x != 0])) != len([x for x in col_vals if x != 0]):
                return False
        
        return True

    # Backtracking solver
    def backtrack(r, c):
        if r == n_rows:
            return True
        
        next_r, next_c = (r, c+1) if c+1 < n_cols else (r+1, 0)
        
        for num in digits:
            board[r][c] = num
            if valid() and backtrack(next_r, next_c):
                return True
            board[r][c] = 0
        
        return False

    backtrack(0,0)
    return board


# -----------------------
# Example 1 (from image)
grid1 = [
    ["K", 16, 10],
    [17, 'A', 'B'],
    [9, 'C', 'D']
]

solution1 = solve_kakuro(grid1)
for row in solution1:
    print(row)

print()

# Example 2 (from image)
grid2 = [
    ["K", 23, 19, 11],
    [22, 'A', 'B', 'C'],
    [21, 'D', 'E', 'F'],
    [10, 'G', 'H', 'I']
]

solution2 = solve_kakuro(grid2)
for row in solution2:
    print(row)
