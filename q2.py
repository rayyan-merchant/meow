def roman_to_decimal(roman_list):
    values = {'i': 1, 'v': 5, 'x': 10, 'l': 50, 'c': 100, 'd': 500, 'm': 1000}
    total = 0
    i = 0
    
    while i < len(roman_list):
        # Current value
        curr_val = values[roman_list[i]]
        
        # Look ahead to next symbol (if any)
        if i + 1 < len(roman_list):
            next_val = values[roman_list[i + 1]]
            if curr_val < next_val:
                total += (next_val - curr_val)
                i += 2  # Skip the next symbol since it’s already processed
            else:
                total += curr_val
                i += 1
        else:
            total += curr_val
            i += 1
            
    return total


# Example usage:
roman_num = ['x', 'i', 'v']
print(roman_to_decimal(roman_num))  # Output: 14
