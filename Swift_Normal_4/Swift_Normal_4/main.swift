//
//  main.swift
//  Swift_Normal_4
//
//  Created by huyu_quq on 17/3/28.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

let someString = "literal"
var emptyString1 = ""
var emptyString2 = String()
emptyString1 = "Not Empty"
emptyString2 = "Chnage Constant String"
print(emptyString1)

let  char:Character = "A"

for char in emptyString1.characters{
    print(char)
    
}
print("emptyString.charcaters.count\(emptyString1.characters.count)")

var string1 = "Hello"
var string2 = " world"
var string3 = string1 + string2
print(string3)
string1 += string2
print(string1)
string1.append("!")
print(string1)



let message = "Hello \(string2) ?"
print(message)
let messChar = message[message.startIndex]
print(messChar)
let firstIndex = message.index(after: message.startIndex)
print(firstIndex)

let lastIndex = message.index(before: message.endIndex)
print(lastIndex)

let index = message.index(message.startIndex, offsetBy: 3)

print(index)

var welcome = "Hello"

welcome.insert("!", at: welcome.endIndex)
print(welcome)
welcome.insert(contentsOf:"world".characters, at: welcome.index(before: welcome.endIndex))
print(welcome)
welcome.remove(at: welcome.index(before: welcome.endIndex));
print(welcome)

let range = welcome.index(welcome.endIndex, offsetBy: -5)..<welcome.endIndex

welcome.removeSubrange(range);
print(welcome)

print(welcome == "Hello")
print(welcome != "Hello")
print(welcome.hasPrefix("He"))
print(welcome.hasSuffix("llo"))

		
