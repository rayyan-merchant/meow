def dfs(grid, r, c, rows, cols):
    # Base case: if out of bounds or water
    if r < 0 or c < 0 or r >= rows or c >= cols or grid[r][c] == 0:
        return
    # Mark current cell as visited
    grid[r][c] = 0
    # Explore 4 directions (up, down, left, right)
    dfs(grid, r - 1, c, rows, cols)
    dfs(grid, r + 1, c, rows, cols)
    dfs(grid, r, c - 1, rows, cols)
    dfs(grid, r, c + 1, rows, cols)


def count_islands(grid):
    rows = len(grid)
    cols = len(grid[0])
    count = 0

    for i in range(rows):
        for j in range(cols):
            if grid[i][j] == 1:
                count += 1
                dfs(grid, i, j, rows, cols)

    return count


# Example grid
example_grid = [
    [1, 1, 0, 0, 0],
    [1, 1, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 1]
]

print("Number of islands:", count_islands(example_grid))
