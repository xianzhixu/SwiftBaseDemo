//
//  main.swift
//  Swift_Normal_22_嵌套类型
//
//  Created by huyu_quq on 17/4/7.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 类型嵌套
//// 可以在允许类型嵌套的类型中嵌套枚举 类 结构体,并且支持多层嵌套
//2. 值类型的嵌套
struct NestedStruct {
    enum enumType1:Character {
        case enumValue1 = "A", enumValue2 = "B",enumValue3 = "C"
    }
    enum enumType2:Int {
        case two = 2, three, four
        struct Values {
            enum num:Int {
                case num1 = 1, num2, num3
            }
        }
    }
}
// 枚举和结构体都是值类型,直接通过类型名称调用
print(NestedStruct.enumType1.enumValue2.rawValue)
print(NestedStruct.enumType2.Values.num.num2.rawValue)

//3. 引用类型嵌套
class ClassType1 {
    class ClassType2 {
        func hello() -> String {
            return "Hello"
        }
    }
    enum enumType2:Int {                 // 引用类型中嵌套值类型
        case two = 2,thress,four
        struct Values {                 // 枚举中嵌套结构体
            enum num:Int {              // 结构体中再嵌套枚举
                case num1 = 1
            }
        }
    }
}
let someClass = ClassType1.ClassType2()    // 引用类型嵌套也是在类型名前面加外部类型的类型名
print(someClass.hello())
print(ClassType1.enumType2.Values.num.num1.rawValue)
