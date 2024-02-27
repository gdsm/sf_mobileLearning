//
//  SwiftSet.swift
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 26/03/20.
//  Copyright © 2020 Gagan. All rights reserved.
//

import Foundation


class SwiftSet  {
    
    func debug() {
        var s = Set<SetBase>()
        
        let n = NSNumber(value: 1)
        let b1 = SetBase(value: n)
        let b2 = SetBase(value: n)

        s.insert(b1)
        print("Set count \(s.count)")
        s.insert(b2)
        print("Set count \(s.count)")
        s.insert(b1)
        print("Set count \(s.count)")
        b2.value = NSNumber(value: 2)
        s.insert(b2)
        print("Set count \(s.count)")
    }
    
}
