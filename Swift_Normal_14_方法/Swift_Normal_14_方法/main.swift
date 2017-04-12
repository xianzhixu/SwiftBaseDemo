//
//  main.swift
//  Swift_Normal_14_方法
//
//  Created by huyu_quq on 17/4/1.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

//1. 方法:完成某些特性功能的函数
// 方法分为需要通过创建实例调用的实例方法和直接可以通过类型名调用的类型方法,结构体.类.枚举中都能定义方法
//2. 实例方法:提供访问和修改实例的属性的方法
class Counter{
    var count = 0                       // 可变属性
    func increment()  {                 // 计数器按一递增的实例方法
        count += 1
    }
    func incrementBy(amount:Int)  {     // 计数器按指定整数递增的实例方法
        count += amount
    }
    func reset()  {                     // 计数器置为0的实例方法
        self.count = 0                  // self可省略,表示当前实例
    }
}
let counter = Counter()
counter.increment()
print(counter.count)
counter.incrementBy(amount: 4)
print(counter.count)
counter.reset()
print(counter.count)


//3.结构体和枚举不是引用类型,是值类型,值类型的属性不能直接在实例方法中修改
struct Point{
    var x = 0.0 ,y = 0.0
    mutating func movedByX(deltaX:Double,y deltaY:Double){
        x += deltaX
        y += deltaY
    }
    
}
var somePoint = Point(x:1.0, y:1.0)
somePoint.movedByX(deltaX: 2.0, y: 3.0) // 该方法是修改了这个点,而不是返回新的点
print("x:\(somePoint.x),y:\(somePoint.y)")

let fixedPoint = Point(x:2.0, y:4.0)
//fixedPoint.movedByX(deltaX: 2.0, y: 2.0)  //// ❌, 常量结构体类型的属性不能被改变


//4. self代表自身,在可变方法中给self赋值
struct NewPoint {                // 利用结构体坐标移动
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX:Double, y deltaY:Double){
        self = NewPoint(x:x + deltaX,y: y + deltaY)
    }
}
var someNewPoint = NewPoint(x:2,y:3)
someNewPoint.moveByX(deltaX: 3, y: 5)
print(someNewPoint)

enum StateSwitch {
    case Off,Low,High        // 定义三种状态
    // 枚举也是值类型,改变其属性也要加mutating
    mutating func next(){
        switch self {
        case .Off:
            self = .Low
            break
        case .Low:
            self = .High
            break
        case  .High:
            self = .Off
            break
        default:
            break
        }
    }
}
var ovenLigth = StateSwitch.Low
ovenLigth.next()
print(ovenLigth)
ovenLigth.next()
print(ovenLigth)


//5. 类方法:直接通过类名本身调用来方法,可以是类,结构体,枚举
enum SomeEnum{
    static func printSome(){
        print("SomeEnum")
    }
}
SomeEnum.printSome()

struct SomeStruct {
    static func printSome() {
        print("SomeStruct")
    }
}
SomeStruct.printSome()

class Level {
    static var commonLevel = 1
    class func addoneLevel() {
        commonLevel += 1
    }
    static func addLevelBy(level:Int){
        commonLevel += level
    }
    var  currentLevel = 1
    func Max(<#parameters#>) -> <#return type#> {
        <#function body#>
    }
    
}

