//
//  main.swift
//  Swift_Normal_23_扩展
//
//  Created by huyu_quq on 17/4/7.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 扩展: 可以为已有的类 结构体 枚举或者协议类型添加新功能,类似OC的分类
// swift中可以扩展的功能:  1. 为已有类型扩展计算型实例属性和计算型类型属性
//                      2. 为已有类型添加新的便利构造器
//                      3. 为已有类型添加新的实例方法和类型方法
//                      4. 为已有类型添加新下标
//                      5. 为已有的类 结构体 枚举添加新的嵌套类型

// 扩展语法
//class SomeClass {      // 定义一个要扩展的SomeClass类
//
//}
//extension SomeClass: someProtocol { // 在类名前面添加extension关键字,冒号后面写协议名
//    
//}

//2. 用扩展为已有类型添加计算型实例属性和计算型类型属性
extension Double {   // 为double添加计算型实例属性
    var m:Double {   // 只读计算型属性可以省略get
        return self
    }
    var cm:Double {  // 将单位长度换算成米并返回
        return self / 100.0
    }
    var mm:Double{
        return self / 1000.0
    }
    
   // var invalid:Double?   // ❌, 扩展不能添加存储属性和属性观察器
    
    
    
}
let oneMeter = 100.cm
let centimetremetre = 10.mm
print("100cm=\(oneMeter)米，10mm=\(centimetremetre)米")

//3. 扩展可以为已有类型添加新的便利构造器,但不能添加新的指定构造器和析构器
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let rect1 = Rect()
// 通过逐一构造器和默认构造器为实例赋值
let rect2 = Rect(origin: Point(x:2.0, y:2.0),size:Size(width:3.0,height:3.0))

// 如果使用构造器为值类型添加构造器时,该值类型原始实现中未定义任何定制的构造器且所有存储属性提供了默认值,
// 这时就可以在扩展中的构造器里调用默认构造器和逐一成员构造器.

extension Rect{
    init(center:Point,size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x:originX,y:originY),size:size)
    }
}
let centerRect = Rect(center:Point(x:4.0,y:4.0),size:Size(width:3.0,height:4.0))
print(centerRect.origin)

//4. 通过扩展可以为已有类型添加新的实例方法和类型方法
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
}
4.repetitions {
    print("Four")
}

extension Int {  // 通过扩展实例方法修改实例本身
    // 结构体和枚举是值类型,所以在改变实例本身的时候需要在方法前面加mutating关键字
    mutating func square(){
        self = self * self
    }
}
var someInt = 3
someInt.square()

//5. 扩展可以为已有类型添加新下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0 ..< digitIndex{
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
print(21372173[2])
print(24569833[6])

//6. 可以为已有的类 结构体 枚举添加新的嵌套类型
extension Int {
    enum Kind {
        case Negative,Zero,Positive
    }
    var kind: Kind{
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
       }
    }
}
func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("-",terminator: " ")
            break
        case .Zero:
            print("0",terminator: " ")
            break
        case .Positive:
            print("+", terminator: " ")
            break
        default:
            break
            
        }
    }
}
printIntegerKinds(numbers: [12,-4,0,32,-74,2,0,12])
		
