//
//  main.swift
//  Swift_Normal_10_闭包
//
//  Created by huyu_quq on 17/3/30.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation
//1. 闭包: 用来捕获,存储传递代码块以及常量和变量的引用
print("Hello, World!")

let nums = [4,6,2,9,5]
let sortNums = nums.sorted()
print(sortNums)

func backward(_ s1:Int, _ s2:Int) -> Bool { // 定义sorted规则 // 传入类型和nums元素一致,返回布尔值

    return s1 > s2
}

let sortNums1 = nums.sorted(by: backward)
// 利用闭包去实现,闭包表达语法:
// { (参数名1: 参数类型, 参数名2: 参数类型) -> 返回类型 in
//     代码块
//     return 返回值
// }

let sortNums2 = nums.sorted(by: { (n1:Int,n2:Int) ->Bool in
    return n1 > n2
})
print(sortNums2)

//2. 闭包的简化
let sortNums3 = nums.sorted(by: {n1,n2 in return n1 < n2}) // 根据上下文推断类型
print(sortNums3)

let sortNums4 = nums.sorted(by: {n1,n2 in n1 > n2 }) // 隐式返回返回单行表达式
print(sortNums4)

let sortNums5 = nums.sorted(by: {$0 > $1})// 内联闭包可以进行参数名缩写,in也可以省略
print(sortNums5)

let sortNums6 = nums.sorted(by: <) // 返回类型正好匹配
print(sortNums6)

// 在开发中为了代码的可读性,刻意简化的代码不提倡

//3. 尾随闭包:调用函数时,要将闭包作为函数的参数传递,如果太长可以写在函数括号之后

func someFunction(label name: String) -> String {  // label参数标签, name 参数名称
    func funcTakeClosure(closure:() -> Void){
        //函数体部分
    }
    funcTakeClosure(closure: { // 不使用尾随闭包进行函数调用
        //闭包主体部分
    })
    funcTakeClosure(){        // 使用尾随闭包调用函数可以省略参数标签
        // 闭包主体部分
    }
    return name
}

let sortNums7 = nums.sorted() { $0 > $1 }
print(sortNums7)
let sortNums8 = nums.sorted {$0 < $1}
print(sortNums8)


//4. 值捕获: 捕获变量或常量
func makeAdd(forAdd amount:Int) -> () -> Int{
    var total = 0
    func add() -> Int{
        total += amount
        return total
    }
    return add
}

let addTen = makeAdd(forAdd: 20)
 print(addTen())
print(addTen())

let addSeven  = makeAdd(forAdd: 7)
print(addSeven())
print(addTen())

//5. 闭包是引用类型

print(addTen()) //addTen其实是引用类型,指向了为add开辟的内存空间

let also = addTen()
print(also)

//6. 逃逸闭包: 当一个闭包作为参数传到一个函数中,这个闭包要在函数返回的时候才会被执行
var headlers:[() ->Void] = []
func funcWithWscaping(handler: @escaping () -> Void){ // 外部定义的闭包需要添加标记@escaping
    headlers.append(handler)
}
func funcWithNoneEscaping(closure: () -> Void)  {
    closure();
    
}
class tempClass {
    var x = 10
    func doSomething() {
        funcWithNoneEscaping {
            x = 200
        }
        funcWithWscaping {
            
            self.x = 100 // 加了@escaping标记,需要显式引用self
        }
    }
}
let instance = tempClass()
instance.doSomething()
print(instance.x)
headlers.first?()
print(instance.x)


//7. 自动闭包: 一种自动创建的闭包,用来当作函数的参数
// 自动闭包只有在调用的时候,闭包中的代码才会被执行
// 这种闭包不接受任何参数,被调用的时候会返回被包装在其中的表达式的值

var names = ["chars","Alex","Olliver","Barry"]
print(names)
print(names.count)

let customerP = {names.remove(at: 0)}// 定义一个自动闭包,内部移除第一个元素
print(names.count) // 闭包没调用,元素个数没变
customerP()
print(names.count) // 执行闭包


func  serve(customerP: () -> String) {
    customerP()
}
serve(customerP: {names.remove(at: 0)})
print(names)
print(names.count)

func serve(customerP:@autoclosure () -> String) {
    customerP()
}
serve(customerP: names.remove(at: 0) )
print(names)
print(names.count)
