//
//  main.swift
//  Swift_Normal_2
//
//  Created by huyu_quq on 17/3/28.
//  Copyright © 2017年 HYWLUO. All rights reserved.
//

import Foundation

print("Hello, World!")

var errorCode:Int? = 404
print(errorCode)
//errorCode = nil
print(errorCode)

var errorMessage:String?

if errorCode != nil{
    print(errorCode!)
}else{
    print(errorMessage)
}
print(errorMessage)

if let code = errorCode {
    print(code)
}else {
    print(errorCode);
    
}

let assumedString:String! = "A"
print(assumedString)
if let TempString = assumedString{
    print(TempString)
}
