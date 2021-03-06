//
//  main.swift
//  Swift_Normal_18_析构过程
//
//  Created by huyu_quq on 17/4/6.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation
//1. 析构过程: 当一个实例不再需要的时候,swift通过自动引用计数去自动清理内存的过程
print("Hello, World!")
// 析构器: 析构器只适用于类类型,类实例被释放前会自动调用析构器,析构器用关键字deinit来标识
class SomeClass{
    deinit {               // 析构器只能定义在类中,且只能是一个
        //执行析构过程        // 子类继承的父类,也就继承了父类的析构器
    }                        // deinit相当于OC的dealloc
}

//2. 析构器实践

class DeinitTest {
    deinit {
        print("deinit")
    }
}
var test:DeinitTest? = DeinitTest() // 定义一个可选类型,为了置为nil释放内存
test = nil                          // deinit, 实例没有引用,内存回收,调用deinit方法
