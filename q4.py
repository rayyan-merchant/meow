from itertools import permutations

# Example puzzle from image:
# Row sums: 17 and 9
# Column sums: 16 and 10
# We need to fill:
#   A B
#   C D

row_sum = [17, 9]
col_sum = [16, 10]

# Digits we can use
digits = [1,2,3,4,5,6,7,8,9]

# Try all combinations of 4 different digits (A, B, C, D)
for A, B, C, D in permutations(digits, 4):
    # Check row sums
    if A + B == row_sum[0] and C + D == row_sum[1]:
        # Check column sums
        if A + C == col_sum[0] and B + D == col_sum[1]:
            print("Solution found:")
            print(f"A={A}, B={B}, C={C}, D={D}")
            print(f"Grid:\n{A} {B}\n{C} {D}")
