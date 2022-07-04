a = ['A', 'B', 'C', 'D', 'E']

r_lst = []

def reverse(lst):
    if lst:
        r_lst.append(lst[-1])
        return reverse(lst[:-1])
    else:
        return r_lst

def reverse_1(lst):
    return lst[::-1]

def reverse_2(lst):
    return list(reversed(lst))

def reverse_3(lst):
    lst.reverse()
    return lst

def reverse_4(lst):
    for i in range(len(lst)//2):
        lst[i], lst[-i-1] = lst[-i-1], lst[i]
    return lst


print(reverse(a))
print(reverse_1(a))
print(reverse_2(a))
print(reverse_3(a))

for i in range(len(a)//2):
    a[i], a[-i-1] = a[-i-1], a[i]
print(a)