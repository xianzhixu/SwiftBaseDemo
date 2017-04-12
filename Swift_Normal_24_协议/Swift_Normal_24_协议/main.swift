//
//  main.swift
//  Swift_Normal_24_协议
//
//  Created by huyu_quq on 17/4/7.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 协议:定义一个规则去实现特定功能.类 结构体 枚举都可以遵守这个协议,并为这个协议的规则提供具体实现
protocol SomeProtocol1 {                // 协议语法
    // 协议内容
}

struct SomeStructure: SomeProtocol1 {   // 遵守协议,冒号(:)后面加协议名称,多个协议之间用逗号隔开
    // 结构体内容
}

class SomeClass: NSObject, SomeProtocol1 { // 有父类的类遵守协议,要将父类名放在协议名之前,用逗号隔开
    // 类的实现
}

//2. 在协议中定义属性: 协议中的属性可以是实例属性也可以是类型属性,协议中的属性只能指定名称和类型以及可读可写
protocol SomeProtocol2 {
    var mustBeSettable: Int { get set } // 类型后面加{ get set }表示该属性可读可写
    var onlyRead: Int { get }           // 类型后面加{ get }表示该属性可读
    static var someTypeProperty: Int { get set } // 类型属性前面加关键字static
}

protocol FullyNamed {                   // 这个协议中只包含一个实例属性
    var fullName: String { get }
}

struct Person: FullyNamed {             // Person遵守FullyNamed协议表示必需要实现fullName属性
    var name: String
    var fullName: String {              // 这个fullName属性可以实现为只读的
        return "Barack Hussein \(name)"
    }
}
let obama = Person(name: "Obama")
print(obama.fullName)                   // Barack Hussein Obama

//3. 在协议中定义方法: 协议可以要求实现某些指定的实例方法和类方法,定义的方式和普通方法相同,但不需要大括号和方法体
protocol SomeProtocol3{
    static func someTypeMethod()
}
protocol RandomNum {
    func random() -> Int
}
class RandomNumGennerator: RandomNum {
    func random() -> Int {
        return Int(arc4random() % 10)
    }
}
let randomNum = RandomNumGennerator()
print(randomNum.random())

//4. Mutating关键字在协议中的应用: 在结构体和枚举即值类型的实例方法中,不能直接修改其实例属性,需要在其方法前面加mutating关键字
protocol toggleProtocol{
    mutating func toggle()
}
enum Toggle:toggleProtocol{
    case Off,On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
            break
        case .On:
            self = .Off
        default:
            break
        }
    }
}
var lightSwitch  = Toggle.Off
lightSwitch.toggle()
print(lightSwitch == .On)

//5. 在协议中定义构造器: 写下构造器的声明,但不需要写花括号和构造器实体
protocol SomeProtocol4 {
    init(someParameter:Int)
}
class SomeInitClass: SomeProtocol4 {
    // 遵守协议的构造器都必须在前面带required修饰符,来确保所有子类都要实现此构造器
    required init(someParameter: Int) {
        //构造器实现部分
    }
}

// 6. 协议作为类型使用: 可以作为函数 方法或构造器中的参数类型或返回值类型,作为常量变量或属性的类型,作数组字典或其他容器中元素的类型
class Dice {                       // 定义一个骰子
    let generator:RandomNum        // 协议类型的存储属性
    init(generator:RandomNum) {
        self.generator = generator
    }
    func roll() -> Int {
        return generator.random()
    }
}
class  RandomNumGennerator1: RandomNum {
    func random() -> Int {
        return Int(arc4random() % 10)
    }
}

var d6 = Dice(generator: RandomNumGennerator1())
print(d6.roll())

//7. 代理设计模式: 可以将类或结构体的一些功能委托给其他类型去实现.代理可以用来响应事件,或接收外部数据源数据
protocol BabyDelegate{
    func feedBaby(baby:Baby)
}
class Baby {
    var needNumFood:Int?                 // baby需要的食物数量
    var babyDelegate:BabyDelegate?       // 代理属性
    func eat()  {                        // 吃这个方法
        babyDelegate?.feedBaby(baby: self)    // 调用代理方法
    }
}
class Nanny: BabyDelegate {
    func feedBaby(baby: Baby) {
        baby.needNumFood = 10
        print("喂baby食物:\(baby.needNumFood!)")
    }
}
let baby = Baby()
let nanny = Nanny()
baby.babyDelegate = nanny
baby.eat()

//8. 在extension中实现协议
protocol SomeProtocol5 {
    // 协议内容
}
extension Nanny:SomeProtocol5{  // 在扩展中遵守协议的效果和在原始类中一样
   // 在实际开发中实现协议的时候推荐这样做,有利于提高代码的阅读性
}

//9. 通过扩展遵守协议: 当一个类实现了协议中的方法,却还没有遵守该协议时,可以通过空扩展体来遵守该协议
protocol SomeProtocol6{
    var description:String{ get }
}
struct Cat {                    // 并没有遵守协议
    var name:String
    var description:String {     // 实现协议中的方法
        return "A cat named:\(name)"
    }
}
extension Cat:SomeProtocol6{}       // 在扩展中实现协议

let lucyTheCat = Cat(name:"lucy")
let sp:SomeProtocol6 = lucyTheCat
print(sp.description)

//10. 协议本身也是种类型,可以放到集合中使用
let things:[SomeProtocol6] = [lucyTheCat]  // 用于存放遵守协议的类
for thing in things{
    print(thing.description)
}

//11. 协议的继承: 和类的继承相似,但协议可以继承一个或多个其它协议
protocol InheritingProtocol:SomeProtocol5,SomeProtocol6{
    // 任何实现InheritingProtocol协议的同时,也必须实现SomeProtocol5和SomeProtocol6
}
//12. 类的专属协议: 通过添加class关键字来限制协议只能被类遵守
protocol SomeClassOnlyProtocol: class, InheritingProtocol{ // class关键字必须出现在最前面
    // 如果被结构体或枚举继承则会导致编译错误
}
//13. 协议合成: 同时采纳多个协议,多个协议之间用 & 分隔.协议的合成并不会生成新的协议类型,只是一个临时局部的
protocol Name {
    var name: String { get }
}
protocol Age {
    var age:Int { get }
}
struct  People:Name,Age {       // 遵守name age这两个协议
    var name: String
    var age : Int
}
func say(to people:Name & Age)  {     // 参数类型:Name & Age
    print("This is \(people.name),age is \(people.age)")
}
let p = People(name:"Joan",age:20)
say(to: p)                          // 只要遵守这两个协议的对象都能被传进去

//14. 检查协议的一致性,如果不一致可以进行转换
// is 检查实例是否符合某个协议,符合返回true,否则返回false
// as? 如果符合某个协议类型,返回类型为协议类型的可选值, 否则返回nil
// as! 将实例强制转化为某个协议类型,如果失败会引发运行时错误

protocol HasArea {
    var area:Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius:Double
    var area :Double{
        return pi * radius * radius
    }
    init(radius:Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area :Double
    init(area:Double) {
        self.area = area
    }
}
class Animal {
    var legs:Int
    init(legs:Int) {
        self.legs = legs
    }
}

//15. 将所有类对象作为AnyObject对象放到数组中
let objects:[AnyObject] = [Circle(radius:3.0),Country(area:23460),Animal(legs: 4)]
for object in objects{
    if let objectWithArea = object as?HasArea{// 判断object是否遵守area协议
//        print(objectWithArea.pi)               // ❌, 所以只有area属性才能被访问
        print(objectWithArea.area)             // 此时的objectWithArea是area协议类型的实例
//        print(objectWithArea.pi)               // ❌, 所以只有area属性才能被访问
    }else{
       print("没有遵守area协议")
    }
}
//16. 协议的可选要求: 协议中的所有方法,属性并不都是一定要实现的,可以在可实现可不实现的方法前面加optional关键字,使用可选方法或属性时,它们的类型会自动变为可选的
// 注意: 可选的协议前面需要加@objc关键字.
//      @objc:表示该协议暴露给OC代码,但即使不与OC交互只想实现可选协议要求,还是要加@objc关键字.
//      带有@objc关键字的协议只能被OC类,或者带有@objc关键字的类遵守,结构体和枚举都不能遵守.
@objc protocol CounterDataSource{      // 用于计数的数据源
    @objc optional var fixAdd:Int { get}   // 可选属性
    @objc optional func addForCount(count:Int) -> Int //可选方法，用于增加数量值
}
class Counter: CounterDataSource {
    var count = 0
    var dataSource:CounterDataSource?
    func add()  {
        if let amount = dataSource?.addForCount?(count: count) {
            count += amount
        }else if  let amount = dataSource?.fixAdd{
            count += amount
        }
    }
}
class  ThreeSource: NSObject,CounterDataSource {
    let fixAdd = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()    // 将counter的数据源设置为ThreeSource
counter.add()
counter.add()
print(counter.count)

//17. 协议的扩展: 可以通过扩展来为遵守协议的类型提供属性 方法 下标
protocol RandomNumG {
    func random() ->Int
}
class RandomNumGen: RandomNumG {
    var description:String {
        return "RandomNumGen"
    }
    func random() -> Int {
        return Int(arc4random() % 10)
    }
}
let randomNumG = RandomNumGen()
print(randomNumG.random())

extension RandomNumG{
    var description:String{
        return "extension"
    }
    func randomBool() -> Bool {
        return random() > 4
    }
}
print(randomNumG.randomBool())
print(randomNumG.description)
