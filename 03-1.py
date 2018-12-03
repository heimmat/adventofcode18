#!/bin/python3

def mark_in_fabric(claim, fabric):
    splitted = claim.split(' ')
    id = splitted[0][1:]
    leftMargin = int(splitted[2].split(',')[0])
    topMargin = int(splitted[2].split(',')[1][:-1])
    width = int(splitted[3].split('x')[0])
    height = int(splitted[3].split('x')[1])

    for i in range(height):
        for j in range(width):
            fabric[topMargin+i][leftMargin+j] += 1
    
def count_two_or_more(fabric):
    twos = 0
    for i in range(len(fabric)):
        for j in range(len(fabric[i])):
            if fabric[i][j] >= 2:
                twos += 1
    return twos


input = open("03-1.input").read()

fabric = [[0 for x in range(1000)] for x in range(1000)]
for line in input.split('\n'):
    mark_in_fabric(line, fabric)

print(count_two_or_more(fabric))
