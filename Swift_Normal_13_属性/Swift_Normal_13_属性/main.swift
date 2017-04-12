//
//  main.swift
//  Swift_Normal_13_属性
//
//  Created by huyu_quq on 17/3/31.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

//1. 存储属性:只能在类和结构体中存储常量和变量
struct Location {
    var x:Double
    let y:Double
}
var position1 = Location(x:22.22,y: 33.33)
position1.x = 20
print(position1.x)
print(position1.y)

let position2 = Location(x:22.2,y:30.3)
//position2.x = 22.22                    // ❌, 这时变量属性也是不可修改的

class Address {                      // 描述地址的类
    let city = "Hangzhou"
    var town:String?
}
let address1 = Address()            // 将一个实例赋值给常量
address1.town = "CangQian"          //其变量属性仍然可变
// 而当把一个引用类型赋值给一个常量的时候,仍可以修改该实例的变量属性

//2. 延迟加载存储属性关键词lazy
class Data {
    var fileName = "data.plist"
    // 此处是比较耗时的数据加载工作
}
class DataManger {
    lazy var data = Data()         // 使用lazy第一次访问的时候才被创建
     // 对数据操作                        // lazy延时加载只能修饰变量,因为常量需要初始值
}
let manager = DataManger()              // 创建实例的时候并没有创建data实例
print(manager.data.fileName)            // 此时才会去执行耗时的数据加载工作

// 如果lazy修饰的属性没有被初始化就被多个线程访问,就会被初始化多次

//3.计算属性:可用于类,结构体,枚举. 不直接存储值,而是提供了一个set和get方法
struct Size {
    var width = 0.0
    var height:Double{
        get{
            print("get")
            return 10.0
        }
        set{
            width = 20.0
            print("set")
        }
    }
}
var size1 = Size()
size1.height = 17
print(size1.width)
print(size1.height)

//4. 只读属性:只有get方法,没有set方法的属性
struct Cubold{
    var width = 0.0,height = 0.0,depth = 0.0
    var volume:Double{
        return width * height * depth
    }
    
}
let fourByFiveByTwo = Cubold(width: 4.0,height:5.0,depth:2.0)
print(fourByFiveByTwo.volume)


//5. 属性观察器,willSet, didSet: 只要为属性设置新值就会调用属性观察器
class StepCounter{
    var totalSteps: Int = 0 {   // 一定要设置初始值
        willSet{                // willSet在新值被设置之前调用
            print(newValue)     // newValue为默认参数名称
        }
        didSet(oldSteps){       // didSet在新值被设置之后调用
            print(oldSteps)     // 修改默认参数oldValue为oldSteps
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 23      // newValue:23 oldSteps: 0
stepCounter.totalSteps = 5       // newValue:5  oldSteps: 23


//6. 类型属性
// 实例属性: 每创建一个实例,该实例都会拥有一套属于自己的值,实例之间的属性相互独立
// 类型属性: 为类型定义属性时,无论创建多少个该类型的示例,该属性都只有唯一一份
struct someStruct{
    static var typeProperty = "Value"      // 使用static定义类型属性
}
class someClass {
    static var typeProperty = "Value"
    static var computedTypeProperty: Int {
        return 6                           // 可以通过闭包返回属性值
    }
}
print(someStruct.typeProperty)
someStruct.typeProperty = "Another value"
print(someStruct.typeProperty)
print(someClass.computedTypeProperty)
