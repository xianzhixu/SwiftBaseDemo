//
//  main.swift
//  Swift_Normal_15_下标
//
//  Created by huyu_quq on 17/4/5.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. 下标: 定义在类.结构体.枚举中,可以快速访问集合列表序列
//subscript(index: Int) -> Int { // 下标语法, subscript(参数名: 参数类型) -> 返回值
//    get{                         // 语法类似于实例方法和计算属性语法的混合
//       // 返回一个整数类型
//        return 0
//    }
//    set(newValue){                // 下标可以设定为读写或者只读
//      // 执行赋值操作
//    }
//    
//    
//}
//2. 只读下标的实现
struct TimeTable{
    let mutiplier:Int
    subscript(index:Int) -> Int {  // 用来表示传入整数的乘法
        print(mutiplier)
        return mutiplier * index
        
    }                              // 省略set,下标定义为只读的
}
let threeTimesTable = TimeTable(mutiplier: 3)  // 通过构造函数赋值给实例成员属性
print(threeTimesTable[6])                       // 18, 通过下标访问实例传入参数并获取返回值


//3.下标的用法
struct Matrix{
    var rows:Int,columns:Int
    subscript(row:Int,column:Int) -> Int {   // 二维下标
        get{
            print("rows:\(rows),columns:\(columns)")
            return rows + columns
        }set{                                // 默认参数newValue
            rows += newValue
            columns += newValue
            
            rows += rows
            columns += columns
             print("gets:rows:\(rows),columns:\(columns)")
        }
    }
}

var matrix = Matrix(rows:2,columns:3)
matrix[2,2] = 8
print(matrix.columns)
print(matrix.rows)
//print(matrix[2,2])
