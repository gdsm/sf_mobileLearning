//
//  Pointers.swift
//  SwiftLearning
//
//  Created by Gagan on 25/04/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation


struct Structure {
    var i3 : Int32 = 3
    var i2 : Int16 = 2
    var i1 : Int = 1
    //var i4 : Int64 = 0
}

class Class {
    var i1 : Int = 1
    var i2 : Int16 = 2
    var i3 : Int32 = 3
    var i4 : Int64 = 4
}

extension (Class) {
    var i5: Double {
        get{
            return 0.0;
        }
    }
}



class Pointers
{
    func debugAll() {
        test1()
    }
    
    func test1(){
        
        func printLog(size: Int, alignment: Int, stride: Int, prefix: String) {
            let msg = prefix + " : " + "Size \(size),  Align \(alignment), Stride \(stride)"
            print(msg);
        }

        var size = MemoryLayout<UInt8>.size
        var align = MemoryLayout<UInt8>.alignment
        var stride = MemoryLayout<UInt8>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "UInt8");

        size = MemoryLayout<UInt16>.size
        align = MemoryLayout<UInt16>.alignment
        stride = MemoryLayout<UInt16>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "UInt16");

        size = MemoryLayout<UInt64>.size
        align = MemoryLayout<UInt64>.alignment
        stride = MemoryLayout<UInt64>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "UInt64");

        size = MemoryLayout<String>.size
        align = MemoryLayout<String>.alignment
        stride = MemoryLayout<String>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "String");

        size = MemoryLayout<String>.size
        align = MemoryLayout<String>.alignment
        stride = MemoryLayout<String>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "String");

        size = MemoryLayout<Structure>.size
        align = MemoryLayout<Structure>.alignment
        stride = MemoryLayout<Structure>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "Structure");

        size = MemoryLayout<Class>.size
        align = MemoryLayout<Class>.alignment
        stride = MemoryLayout<Class>.stride
        printLog(size: size, alignment: align, stride: stride, prefix: "Class");

    }
    
    func test2(){
       
    }
    
}
