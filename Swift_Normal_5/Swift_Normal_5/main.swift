//
//  main.swift
//  Swift_Normal_5
//
//  Created by huyu_quq on 17/3/28.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation
print("Hello, World!")

var arrInts = [Int]()

arrInts.append(2)
arrInts = []
arrInts = [1,4]

var threeDouble = [Double](repeating:0.0,count:3)
var twoDouble = [Double](repeating:2.0,count: 2)
var fiveDouble = threeDouble + twoDouble

print(threeDouble)
print(twoDouble)
print(fiveDouble);
twoDouble += threeDouble
fiveDouble = threeDouble + twoDouble
print(fiveDouble)

let secondNum = twoDouble[2]
twoDouble[0] = 3.0
print(twoDouble)
twoDouble[1...2] = [3.0,3.0]
print(twoDouble)

twoDouble.insert(4.0, at: 0)
print(twoDouble)
twoDouble.remove(at: 0)
print(twoDouble)
twoDouble.removeLast()
print(twoDouble)

for arrItem in twoDouble{
    print(arrItem)
}
for (index,value) in twoDouble.enumerated(){
    print("索引:\(index),元素:\(value)")
}
