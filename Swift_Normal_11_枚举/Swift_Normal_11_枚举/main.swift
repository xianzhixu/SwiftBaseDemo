//
//  main.swift
//  Swift_Normal_11_枚举
//
//  Created by huyu_quq on 17/3/31.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

//1. 枚举: 将一组相关的值定义成共同的类型
enum enumName{               // 枚举的语法格式,可以不指定成员类型
    case caseName            // 使用case定义枚举成员值
}
enum compassPoint {           // 用枚举表示指南针的四个方向
    case North                // 枚举成员不会像OC进行隐式赋值
    case South
    case East
    case West
}
enum compassPoint2 {
    case North,South,East,West   // 成员值也可以横着写
}
var direction = compassPoint.North // direction为compassPoint类型
print(direction)
direction = .West                  // 类型确定之后就可以有简略写法
print(direction)

//2. 使用switch语句匹配枚举值
direction = .East
switch direction{
case .North:
    print("NORTH")
    break
case .South:
    print("SOUTH")
    break
default:
    print("EAST OR WEST")      // EAST AND WEST
    break
}

//3. 关联值: 枚举可以存储和修改不同类型的关联值
enum Person {
    case Location(Double,Double)
    case Name(String)
}
var p1 = Person.Location(87.22, 90.66)
//p1 = .Name("Alex")
//p1 = .Name("Joan")

switch p1{
case .Location(let x,let y):
    print("X:\(x),Y:\(y)")
    break
case .Name(let name):
    print(name)
    break;
}


//4. 原始值:可以给枚举成员设置默认填充值,但类型必须一致
enum ASCIIChar:Character{ // 声明枚举成员值类型
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIChar.LineFeed.rawValue)
// 原始值的隐藏赋值,当使用整数作为原始值时,隐式赋值依次递增1
enum Mouth:Int{  // 枚举成员类型: Int
    case January = 1,February,March,April,May
}   // 如果想要像OC的枚举设置隐式赋值,可以设置枚举成员类型为: Int
print(Mouth.March.rawValue)


enum Direct:String { // 枚举成员类型: String
    case North
    case South
    case East
    case West
}
print(Direct.North.rawValue)
// 在定义枚举类型的时候使用了原始值,会自动获得一个初始化方法
let secondMonth = Mouth(rawValue:2)
print(secondMonth!)

//5. 用递归枚举创建表达式:(5+4)*2
enum Arth{
    case Number(Int)
    indirect case Add(Arth,Arth)
    indirect case Mul(Arth,Arth)
}

let five = Arth.Number(5)
let four = Arth.Number(4)
let sum = Arth.Add(five, four)
let result = Arth.Mul(sum, Arth.Number(2))

func evaluate(express:Arth) -> Int {
    switch express {
    case .Number(let value):
        return value
    case .Add(let left, let right):
        return evaluate(express: left) + evaluate(express: right)
    case .Mul(let left, let right):
        return evaluate(express: left) * evaluate(express: right)
        
    default:
        break
    }
}
print(result)
print(evaluate(express: result))

