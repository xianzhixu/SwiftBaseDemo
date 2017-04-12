//
//  main.swift
//  Swift_Normal_12_类和结构体
//
//  Created by huyu_quq on 17/3/31.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation
//1. 类和结构体: 都可以通过定义属性和添加方法来扩展功能
print("Hello, World!")
// 类和结构体的共同点:通过定义属性存储值; 通过定义方法提供功能; 通过定义构造器生成初始化值

// 类与结构体的区别:
// 类:允许一个类继承另一个;允许引用计数器对一个类的多次引用
// 结构体:结构体通过复制的方式在代码中传递; 不使用引用计数器

//2. 类与结构体的语法定义
class ClassName {
    //属性和方法
}
struct StructureName {
    //属性和方法
}

//3.实例化类和结构体,访问属性
struct Resolution{
    var width = 2
    var height = 3
}

class VideoMode {                    // 定义名为VideoMode的类
    var resolution = Resolution()    // 初始化一个新的Resolution结构体实例
    var interlacted = false          // 定义默认值为false的布尔类型
    var frameRate = 0.0              // 默认值为0.0的Double类型
    var name:String?                 // 默认值为nil的String可选类型
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
print(someResolution.width)
print(someVideoMode.resolution.height)

someVideoMode.resolution.height = 32   // 可以直接为属性和子属性赋值
print(someVideoMode.resolution.height)

//4. 结构体的默认构造器
let initRes1 = Resolution(width: 64,height:48)// 结构体可设置属性的默认构造器
print("\(initRes1.width),\(initRes1.height)")
// 类没有默认构造器,需要自定义

//5. 结构体和枚举的值传递都是通过值拷贝
var initRes2 = initRes1
print(initRes1.width)
print(initRes2.width)
initRes2.width = 32
print(initRes1.width)
print(initRes2.width)

enum Direction {
    case North,South,East,West
}
var direct1 = Direction.North
var direct2 = direct1
direct2 = Direction.South
print(direct1)
print(direct2)

//6. 类是引用拷贝,拷贝后的值的改变会影响原来的
let videoM1 = VideoMode()
videoM1.name = "VideoM1"
var videoM2 = videoM1
videoM2.name = "videoM2"
print(videoM1.name!)
print(videoM2.name!)
// 恒等运算符(===)用三个等于表示,表示两个类型的常量或变量是否引用同一个实例
print(videoM1 === videoM2) // true, 使用"==="判断两个引用是否指向同一个对象

//7. 类和结构体的选择

// 结构体: 只是用来封装少量简单的数据值;实例被赋值或传递存储的时候需要进行值拷贝,不需要用到继承
// 类: 需要包含复杂的属性方法,能形成一个抽象的事物描述;需要用到继承;需要用到引用拷贝

// 字符串,数组,字典的底层都是通过结构体实现的,所以它们在被赋值的时候都是通过值拷贝,
// 当然了swift在内部会做性能优化,不会是只要赋值就拷贝,只有在必要的时候才会进行值拷贝.


		
