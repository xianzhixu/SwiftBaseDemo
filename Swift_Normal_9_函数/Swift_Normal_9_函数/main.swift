//
//  main.swift
//  Swift_Normal_9_函数
//
//  Created by huyu_quq on 17/3/29.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

func greet(person:String) -> String {
    return "Hello,\(person)"
}
let greetWord = greet(person: "Dream")
print(greetWord)

func say() -> String {
    return "Hello"
}
print(say())

func say2(person1:String,person2:String) -> String {
    return "Hello,\(person1) \(person2)"
}
print(say2(person1: "Lili", person2: "Mini"))

func sayHello()  {
    print("Hello")
}
sayHello()

func minMax(array:[Int]) -> (min:Int,max:Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMac = array[0]
    for value in array[ 1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMac{
            currentMac = value
        }
    }
    return (currentMin,currentMac)
}

let bounds = minMax(array: [3,5,6,12,8,10])
print(bounds!.max)
print(bounds!.min)


func someFunction(label name:String) -> String {
    return name
}
print(someFunction(label:"Dariel"))


func ignoreLabel(_ name1:String,label2 name2:String)  {
    print(name1 + name2)
}
ignoreLabel("good", label2: "bab")

func defaultLabel(label1 name1:String,label2 name2:String = "Lily")  {
    print(name1 + name2)
}
defaultLabel(label1: "HaHa")
defaultLabel(label1: "HaHa", label2: "HeHe")


func avarageNum(_ num:Double...) -> Double {
    var total:Double = 0
    
    for number in num{
        total += number
    }
    return total/Double(num.count)
}
print(avarageNum(2,6,4,8,7))
print(avarageNum(5))

func swapTwoInts(_ a:inout Int,_ b:inout Int){
    let temp = a
    a = b
    b = temp
}
var a = 2
var b = 3
swapTwoInts(&a, &b)
print("a=\(a),b=\(b)")

var swap2 = swapTwoInts
swap2(&a,&b)
print("a=\(a),b=\(b)")

//函数作为参数传入另一个函数
func sum(num1:Int,num2:Int) -> Int {
    return num1 + num2
}
func sub(num1:Int,num2:Int) -> Int {
    return num1 - num2
}
func mathNumber(_ mathFunc:(Int,Int) -> Int, _ a:Int,_ b:Int) -> Int {
    return (mathFunc(a,b))
}
print(mathNumber(sum, 4, 2))
print(mathNumber(sub, 4, 2))

//函数的返回值是另外一个函数
func chooseSumOrSun1(_ isSum:Bool) -> (Int,Int) -> Int {
    return isSum ? sum: sub
}
print(chooseSumOrSun1(true)(2,4))

// 函数的嵌套
func chooseSumOrSun(isSum:Bool, _ a:Int, _ b:Int) -> Int {
    func sum(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    func sub(num1:Int, num2:Int) -> Int {
        return num1 - num2
    }
    return isSum ? sum(num1: a, num2: b) : sub(num1: a, num2: b)
}
print(chooseSumOrSun(isSum: true, 4, 4))
