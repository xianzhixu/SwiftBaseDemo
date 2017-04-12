//
//  main.swift
//  Swift_Normal_27_访问控制
//
//  Created by huyu_quq on 17/4/11.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 访问控制: swift中可以对各种类型进行访问控制,从而隐藏代码的实现细节,为其他人访问代码提供接口
// 访问控制有两个基本单元,模块和源文件.模块:一般为单独的框架或者应用,使用模块需要用import导入
//                               源文件:应用或框架中一个个文件
// 访问级别: 公开访问: 可以在同一模块中访问任何类型,如果在导入模块后,别的模块也能访问该模块的任何类型
//          内部访问: 只能在模块内部访问,模块外部不能访问
//          文件私有访问: 只能在文件内部访问
//          私有访问: 只能在被限制的访问作用域来访问

//2. 访问控制语法: 在类型前面加访问限制关键字public,internal,fileprivate,private
public class PublicClass {}           // 公开访问
internal class InternalClass {}       // 内部访问,如果不加访问限制那么默认添加internal
fileprivate class FileprivateClass {} // 文件私有访问
private class PrivateClass{}          // 私有访问

// 元组类型的访问限制: 由元组中访问级别最严格的类型来决定
internal let x = 2
private let y = 3
let tupleA = (x,y)                    // 此时tupleA的访问级别为private

// 函数的访问限制是根据最严格的参数类型和返回类型的访问限制来决定的
// 函数前面不加private,就无法访问private的返回值.
private func someFunction() -> (InternalClass,PrivateClass){
    return (InternalClass(),PrivateClass())
}

// 枚举成员的访问级别和枚举类型相同,不能为枚举成员指定不同的类型
public enum CompassPoint {
    case North, South, East,West
}

//3. 常量 变量 属性 下标不能拥有比它们更高的访问级别
private var privateC = PrivateClass()   // 如果类型是private级别的,变量的访问级别必须明确为private
// 通过设置set get方法为常量 变量 属性 下标 设置读写权限
struct ChangedString {                   // 记录value属性的修改次数
    private(set) var numberOfEdits = 0   // 该属性在该结构体中是可读可写的,但在该外面是只读的
    var value:String = "" {              // value为默认访问级别
        didSet {
            numberOfEdits += 1
        }
    }
}
var stingOfEdit = ChangedString()
stingOfEdit.value = "ABC"
stingOfEdit.value = "OPQ"
print(stingOfEdit.numberOfEdits)
//stingOfEdit.numberOfEdits = 3              // ❌,numberOfEdits属性的set方法的限制类型为private
