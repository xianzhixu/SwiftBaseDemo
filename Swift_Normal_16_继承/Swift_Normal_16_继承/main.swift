//
//  main.swift
//  Swift_Normal_16_继承
//
//  Created by huyu_quq on 17/4/5.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 继承: 一个类可以继承另一个类的方法,属性及其它特征
class Vehicle{                                   // 定义了一个机动车的父类
    var currentSpeed = 0.0                       // 速度属性
    var description:String{                      // 描述速度的只读计算属性
        get {
            return "\(currentSpeed)公里/每小时"
        }
    }
    func makeNoise()  {
        //为空
    }
}
let someVehicle = Vehicle()               // 创建一个实例
print("速度：\(someVehicle.description)")  // 速度: 0.0公里/每小时

//// 定义子类,子类获得父类的所有特性
class Bicycle: Vehicle{                   // 定义子类继承Vehicle
    var hasTwoWheels = true
}
let bicycle = Bicycle()
bicycle.hasTwoWheels = true
bicycle.currentSpeed = 15.0
print("描述：\(bicycle.description)")


//2. 子类还可以被其他类继承
class Tandem: Bicycle{                    // 双人自行车
    var canRideByTwoPeople = true
}
let tandem = Tandem()
tandem.hasTwoWheels = true
tandem.canRideByTwoPeople = true
tandem.currentSpeed = 10.0
print("描述2：\(tandem.description)")

//3.重写: 子类可以对继承自父类的实例方法,类方法,实例属性,下标进行重写
class Train: Vehicle{
    var passenger = 20
    override var currentSpeed: Double{      // 重写属性观察器
        didSet{
          passenger = Int(currentSpeed / 10)
        }
    }
    override func makeNoise() {              // 重写父类方法需要在前面加override关键字
        print("咣当咣当咣当")
    }
    override var description: String{
        return super.description + "有\(passenger)个乘客"  // super.description返回继承的值
    }
}

let train = Train()
train.makeNoise()                 // 调用重写的方法
print(train.description)          // 0.0公里/每小时,有0个乘客
train.currentSpeed = 200          // 调用属性观察器的didSet方法
print(train.description)          // 200.0公里/每小时,有20个乘客

//4.final关键字:防止方法 属性 下标被重写
class Animal {
    // 如果方法 属性 下标想不被重写, 可以在最前面添加关键字 final
    final func run() {
        print("Running!")
    }
}
final class Dog :Animal{     // 在class前添加final,Dog类不可以被继承
//    override func run(){}    // ❌, run方法不可以被重写
}
