#!/bin/python3
import collections
import numpy as np

def mark_in_fabric(claim, fabric, sizes):
    splitted = claim.split(' ')
    id = splitted[0][1:]
    leftMargin = int(splitted[2].split(',')[0])
    topMargin = int(splitted[2].split(',')[1][:-1])
    width = int(splitted[3].split('x')[0])
    height = int(splitted[3].split('x')[1])
    sizes[id] = width * height
    for i in range(height):
        for j in range(width):
            fabric[topMargin+i][leftMargin+j].append(id)

    
def count_two_or_more(fabric):
    twos = 0
    for i in range(len(fabric)):
        for j in range(len(fabric[i])):
            if len(fabric[i][j]) >= 2:
                twos += 1
    return twos

def identifySingle(fabric):
    singles = {}
    for i in range(len(fabric)):
        for j in range(len(fabric[i])):
            if len(fabric[i][j]) == 1:
                id = fabric[i][j][0]
                if (id in singles.keys()):
                    singles[id] += 1
                else:
                    singles[id] = 1
    return singles


input = open("03-1.input").read()

sizes = {}
fabric = [[[] for x in range(1000)] for x in range(1000)]
for line in input.split('\n'):
    mark_in_fabric(line, fabric, sizes)

print(count_two_or_more(fabric))
singles = identifySingle(fabric)
for key in sizes.keys():
    if key in singles.keys():
        if sizes[key] == singles[key]:
            print("{} is our winner".format(key))

