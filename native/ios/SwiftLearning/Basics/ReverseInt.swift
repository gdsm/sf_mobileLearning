//
//  ReverseInt.swift
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 15/11/20.
//  Copyright © 2020 Gagan. All rights reserved.
//

import Foundation


class ReverseInt {
    
    func reverse(_ value: Int) -> Int {
        var rev = 0
        var i = value
        var arr: [Int] = []
        
        while i > 0 {
            arr.insert((i % 10), at: 0)
            i = i / 10
        }
        
        i = 1
        for (_ , v) in arr.enumerated() {
            rev = rev + v * i
            i = i * 10
        }
        
        return rev
    }
    
    public func debug() {
        print("Reverse : \(reverse(8475984375))")
    }
    
}
