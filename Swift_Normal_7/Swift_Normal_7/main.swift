//
//  main.swift
//  Swift_Normal_7
//
//  Created by huyu_quq on 17/3/29.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

var chars:[String:String] = ["char1":"A","char2":"B"]
var charDict = ["char1":"A","char2":"B"]
print(chars.count)
print(chars.isEmpty)
chars["char3"] = "C"
chars["char1"] = "a"
print(chars)
chars.updateValue("b", forKey: "char2")
print(chars)

print(chars["char2"]!)

chars["char3"] = nil
print(chars)
chars.removeValue(forKey: "char2")
print(chars)

for (k,val) in charDict{
    print("\(k):\(val)")
}

for key in charDict.keys{
    print(key)
}
for value in charDict.values{
    print(value)
}
let arrkeys = [String](charDict.keys)
print(arrkeys)
let arrValues = [String](charDict.values)
print(arrValues)
		
