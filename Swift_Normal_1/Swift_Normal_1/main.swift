//
//  main.swift
//  Swift_Normal_1
//
//  Created by huyu_quq on 17/3/28.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

let three = 3
var pointOneFour = 0.14
var pi = 4.44

 pi = Double(three) + pointOneFour
print("goooood===",pi)


let trueValue = true
let falseValue = true
let i = 2;
if i != 1 {
    print(i == 1)
}
let http404Error = (404,"Not Found")
let (code,message) = http404Error
print("code:\(code),message:\(message)")
let (_,ErrorMessage) = http404Error
print(http404Error.1)
let ErrorCode = (requestError:401,402,403)

var erroeCode:Int? = 404
//print(erroeCode!)
erroeCode = nil
print(erroeCode)
