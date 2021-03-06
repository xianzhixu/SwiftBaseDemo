//
//  main.swift
//  Swift_Normal_20_可选链式调用
//
//  Created by huyu_quq on 17/4/6.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 可选链式调用:通过点语法调用属性,方法和下标
// 可选链式调用可以在当前值为nil的情况下调用属性,方法,下标方法.如果可选值有值,那么调用成功,
// 如果没有值,那么调用失败.也可以是多个调用连接在一起,如果其中有一个节点为nil,整个调用链都
// 会调用失败,返回nil

// 使用可选链式调用替代强制展开
class Person {
    var home:Home?
}
class Home {
    var numberOfRooms = 1
}
let p1 = Person()                           // p1有一个为nil的home属性
//let roomCount = p1.home!.numberOfRooms    // ❌, 如果使用感叹号(!)强制解包会报错
if let roomCount = p1.home?.numberOfRooms{  // 使用问好(?)来替代感叹号(!)
    print(roomCount)                        // 就可以在p1.home为空的情况下访问后面的属性
}else{
    print("roomCount为nil")
}

p1.home = Home()
if let roomCount = p1.home?.numberOfRooms{    // 可选链式调用返回的是一个可选类型
    print(roomCount)
}else{
    print("roomCount为nil")
}

//2. 为可选链式调用定义模型类
// 通过可选链式可以调用多层属性,方法和下标,并且能够判断这些子属性,方法或下标是否可以访问.
// 下面定义了四个模型类
class People{
    var residence:Residence?
}
class Room {
    let name:String
    init(name:String) {
        self.name = name
    }
}
class Address {
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    func buildingIndentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil && street != nil{
            return "\(buildingNumber) \(street)"
        }else{
            return nil
        }
    }
    
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms:Int{
        return rooms.count                // 返回rooms的count属性的值
    }
    var address:Address?
    subscript(i:Int) -> Room {            // 通过下标来访问rooms中指定位置的元素
        get {
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms()  {          // 用来打印room数的方法
        print(numberOfRooms)
    }
}

//3. 通过可选链式访问属性
let jone = People()
if let roomCount = jone.residence?.numberOfRooms{
    print(roomCount)
}else{
    print("jone.residence为nil")
}

let someAddress = Address()
someAddress.buildingNumber = "22"            // 通过可选链式调用来设置属性
someAddress.street = "Acacia Road"
jone.residence?.address = someAddress        // 属性设置失败,因为jone.residence为nil

//4. 通过可选链式调用方法
if let identifier = jone.residence?.address?.buildingIndentifier(){
    print(identifier)                     // identifier为空,此处不会被执行
}
jone.residence = Residence()
jone.residence?.address = someAddress
if let identifier = jone.residence?.address?.buildingIndentifier(){
    print(identifier)
}

//5. 通过可选链式访问下标
jone.residence?.rooms = [Room(name:"Jones"),Room(name:"Johns")] // 添加两个房间名称
if let firstRoomName = jone.residence?[0].name {
    print(firstRoomName)
}
//6. 多层可选链式调用
// 通过可选链式调用非可选类型,将会返回一个可选类型,通过可选链式调用可选类型,返回的依然还是可选类型
if let joneStreet = jone.residence?.address?.street{    // 当有一个属性为nil时调用失败
    print(joneStreet)
}
//7. 在方法的可选返回值上进行可选链式调用
// 直接在方法的返回值上进行可选链式调用,只要加一个问好(?)
if let beginWithThe = jone.residence?.address?.buildingIndentifier()?.hasPrefix("22"){
    print(beginWithThe)
}
