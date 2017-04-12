//
//  main.swift
//  Swift_Normal_6
//
//  Created by huyu_quq on 17/3/28.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation
print("Hello, World!")
var char1 = Set<Character>()
let char2:Set<Character> = []

var letter1:Set = ["a","b","c"]
var letter2 = ["a","b","c"]
print(letter1.count)
print(letter1.isEmpty)
print(letter1)
letter1.insert("d")
print(letter1)
print(letter1.count)
letter1.remove("c")
print(letter1)


print(letter1.contains("a"))
//letter1.remove("a")
//print(letter1)
//print(letter1.count)
for char in letter1{
    print(char)
}
for char in letter1.sorted(){
    print(char)
}

var num1:Set = ["3","2","1","5","7"]
let num2:Set = ["3","2","1","5","7"]
let num3:Set = ["1","3","5"]
let num4:Set = ["8","9"]

print(num1.intersection(num3))
print(num1.union(num3))
print(num1.subtracting(num3))
print(num1.symmetricDifference(num3))

print(num2 == num3)
print(num3.isSubset(of: num2))
print(num2.isSuperset(of: num3))
print(num1.isDisjoint(with: num3))
print(num1.isDisjoint(with: num4))

