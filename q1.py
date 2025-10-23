# 1. Check if an element is in a set
def set_member(x, S):
    return x in S


# 2. Union of two sets
def set_union(S1, S2):
    result = S1.copy()
    for item in S2:
        if item not in result:
            result.append(item)
    result.sort()
    return result


# 3. Intersection of two sets
def set_intersection(S1, S2):
    result = []
    for item in S1:
        if item in S2:
            result.append(item)
    result.sort()
    return result


# 4. Cardinality of a set (number of elements)
def set_cardinality(S):
    return len(S)


# 5. Difference of two sets (S1 - S2)
def set_difference(S1, S2):
    result = []
    for item in S1:
        if item not in S2:
            result.append(item)
    result.sort()
    return result


# ✅ Optional: Operator versions
def union(S1, S2):
    return set_union(S1, S2)

def intersection(S1, S2):
    return set_intersection(S1, S2)


# ✅ Bonus: Power set (set of all subsets)
def power_set(S):
    result = [[]]
    for elem in S:
        new_subsets = [subset + [elem] for subset in result]
        result.extend(new_subsets)
    return result



if __name__ == "__main__":
    S1 = [1, 2, 3]
    S2 = [3, 4, 5]

    print("Set 1:", S1)
    print("Set 2:", S2)

    print("Member check (2 in S1):", set_member(2, S1))
    print("Union:", set_union(S1, S2))
    print("Intersection:", set_intersection(S1, S2))
    print("Difference (S1 - S2):", set_difference(S1, S2))
    print("Cardinality of S1:", set_cardinality(S1))
    print("Power Set of S1:", power_set(S1))
