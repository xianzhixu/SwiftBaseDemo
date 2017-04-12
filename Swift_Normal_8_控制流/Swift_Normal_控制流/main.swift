//
//  main.swift
//  Swift_Normal_控制流
//
//  Created by huyu_quq on 17/3/29.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
for num in 1...5{
    print(num)
}
for _ in 1...5{
    print("ABCD")
}

let chars = ["A","B","C","D"]
for char in chars{
    print(char)
}
let charDict = ["0":"A","1":"B","2":"C"]
for(key,value) in charDict{
    print("key:\(key),value:\(value)")
}

var num = 3

while num > 0{
    print(num)
    num -= 1
}


num = 3
repeat {
    print(num)
    num -= 1
}while num < 0

if num == 3{
    print(num)
}else{
    print("num is not equeal to 3")
}

if num == 3 {
    // 执行语句
}else if num == 4 {                   // 通过 else if实现多个分支
    // 执行语句
}else {                               // 当不需要完整判断 else语句可以省略
    // 执行语句
}

num = 12

switch num{
    case 2:
    print("num等于2")
    break
    case 3,4,5:
    print("num == 3 or 4 or 5")
    break
    case 6..<10:
    print("num大于等于6，且小于10")
    break
    case 10..<19 where num % 3 == 0:
    print("num大于等于10，且小于19，且能被3整除")
    break
    default:
    print("上面的情况都不满足")
    break
}
num = 5

while num > 0{
  print(num)
  num -= 1
    if num == 2{
        print("this continue")
        continue
    }
}

num  = 5

while num > 0{
    print(num)
    num -= 1
    if num == 2{
        print("this break")
        break
    }
}

num = 2
switch num{
case  2:
 print("Hello")
    fallthrough
default:
    print("World")
    break
}


var num2 = 4
num = 6
numLoop:while num > 0{
    num2Loop:while num2 > 0{
        print("num2:\(num2)")
        num2 -= 1
        break numLoop   // break  哪个循环，哪个循环就停止
    }
    print(num)
    num -= 1
}


//guard 语句
num2 = 4
func guardTest()  {
    guard  num2 == 5 else {
        print(num2)
        return
        
    }
}
guardTest()


if #available(iOS 10, *){
    print("iOS10 以上的API")
}else{
   print("iOS10 以下的API")
}
/*
 if #available(iOS 10, *) { // 平台还可以是: iOS macOS watchOS tvOS
 // 使用iOS10及以上的API
 }else {
 // 使用iOS10以下的API
 }
 */
