//
//  main.swift
//  Swift_Normal_17_构造过程
//
//  Created by huyu_quq on 17/4/5.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 构造过程: 通过自定义构造器对类 结构体 枚举的实例进行初始化操作
struct Weather {
    var temperature :Double       // 也可以直接设置默认属性
    init() {                      // 不带参数的构造器:init() {构造过程}
        temperature = 26.0        // 在构造器中给存储属性赋值
    }
}
var w = Weather()                // 初始化过程会调用构造方法
print(w.temperature)

//2. 自定义构造过程
struct Point {
    var x = 2.0, y = 4.0      // 原始位置
    let z:Double              // 定义一个常量
    // pointX参数内部名称在构造方法内部使用,外部名称在使用构造方法的时候使用
    init(fromPointX pointX:Double,_ pointY:Double) {
        x += pointX
        y += pointY
        z  = pointX                  // 常量在构造过程中被赋值后不可更改
    }
    // 如果没有提供外部名称,swift会自动生成一个和内部名称相同的外部名
    
}
let point = Point(fromPointX: 3.0,3.0)
print("x:\(point.x),y:\(point.y)")

//3.默认构造器:如果结构体和类的所有属性都有默认值,同时没有自定义构造器,swift会提供一个默认构造器
class List {
    var name:String?                      // 可选类型默认设置为nil
    var quantity = 1
    var putchased = false
}
var item = List()                        // 使用默认构造器创建一个List实例
print("\(item.name) \(item.quantity) \(item.putchased)")

struct Size {
    var  width = 0.0,height = 0.0
    
}
var size1 = Size(width:3.0,height:4.0)
print(size1.height)

//4.值类型的构造代理:构造器调用其他构造器来完成部分实例化
struct RectSize {
    var  width = 0.0,height = 0.0
    
}
struct RectPoint {
    var x = 0.0 ,y = 0.0
    
}
struct Rect {
    var origin  = RectPoint()
    var size = RectSize()
    init() {}            // 没有执行任何构造过程,返回一个Rect实例
    init(origin:RectPoint,size:RectSize) {
        self.origin = origin;
        self.size = size
    }
    init(center:RectPoint,size:RectSize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: RectPoint(x:originX,y:originY),size:size)
        
    }
}
let basicRect = Rect()
let originRect = Rect(origin:RectPoint(x:2.0,y:2.0),size:RectSize(width:2.0,height:2.0))
let centerRect = Rect(center:RectPoint(x:3.0,y :3.0),size:RectSize(width:2.0,height:2.0))
print("originRect:\(originRect.origin.x),centerRect:\(centerRect.origin.x)")

//5.类的构造: 类的所有属性包括继承父类的都必须在构造过程中设置初始值.类有两种构造器指定构造器和遍历构造器
//init(参数) {                            // 指定构造器语法,初始化类中提供的所有属性,
//    // 初始语句                         // 会调用父类构造器来实现父类的初始化,
//}                                      // 所有类都必须拥有父类构造器,但也能通过继承获得.
//
//convenience init(参数) {                // 便利构造器语法,init前加关键字convenience
//    // 初始语句                         // 比较次要的,一般用来使类的构造过程更清晰明了
//}
// 子类的指定构造器会调用父类的指定构造器,便利构造器必须调用该类的指定构造器

//6.构造器的继承和重写
class Vehicle  {
    var wheels = 1                      // 定义一个提供默认值的存储属性
    var description:String {            // 返回String的计算属性
        return "有\(wheels)个轮子"
    }
}
let vehicle = Vehicle()
print(vehicle.description)

class Bicycle: Vehicle {                 // 继承Vehicle的子类
    override init(){                     // 构造器和父类相同要加override,需要重写父类构造器
        super.init()                     // 初始化父类构造器
        wheels = 2
    }
}
let bicycle = Bicycle()
print(bicycle.description)


//7.指定构造器和遍历构造器的实践
class Food{
    var name:String
    init(name:String) {                // 指定构造器
        self.name = name
    }
    convenience init(){                // 便利构造器,横向调用指定构造器
        self.init(name:"名字未知")
    }
}

let nameMeat = Food(name:"Becon")
print(nameMeat.name)
let unknownMeat = Food()
print(unknownMeat.name)

class Recepe: Food {
    var quantity :Int
    init(name:String,quantity:Int) {
        self.quantity = quantity
        super.init(name:name)
    }
    override convenience init(name:String){
        self.init(name:name,quantity:1)
    }
}
let recepe1 = Recepe()
print("\(recepe1.name),\(recepe1.quantity)")
let recepe2 = Recepe(name:"Beef")
print("\(recepe2.name),\(recepe2.name)")
let recep3 = Recepe(name:"Egg",quantity:3)
print("\(recep3.name),\(recep3.quantity)")

//8.可失败构造器:类,结构体或枚举在定义的时候有可能会失败,可以定义可失败构造器
struct Animal {
    let species:String
    init?(species:String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let cat = Animal(species:"Cat")
print(cat)
let someAnimal = Animal(species:"")
print(someAnimal)

enum Unit {
    case Alex,Bill,Carle
    init?(char:Character) {
        switch char {
        case "A":
            self = .Alex
            break
        case "B":
            self = .Bill
            break
        case "C":
            self = .Carle
            break
        default:
            return nil
        }
        
    }
}

let unit1 = Unit(char:"B")
let unit2 = Unit(char:"D")
print(unit1!)
print(unit2)

//9.必要构造器:子类必须实现的构造器
class SomeClass {
    required init(){   // 添加required修饰符表示该类的子类都必须实现该构造器
        //构造器内部实现
    }
}
class Subclass: SomeClass {  // 此时重写父类的指定构造器时,就不需要添加override修饰符
    required init() {         // 子类也需要添加required,来应用于当前类的子类
    }
}

//10.通过闭包或函数设置属性的默认值
class OtherClass{
    let someProperty : String = {
        return "someValue"       // 返回值得类型要和String一致
    }()                          // 后面加()表示立即执行此闭包,不加就相当于把闭包本身赋值给属性
}
let oClass = OtherClass()
print(oClass.someProperty)
