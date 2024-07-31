//
//  LazySequence.swift
//  SwiftLearning
//
//  Created by Gagandeep on 26/07/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation


struct LazySequence {
    
    func debug() {
        let nums = Array(0...1000)
        let doubler = nums.lazy.map {
            print("Evaluating \($0)")
            return $0 * 2
        }
        print(doubler[100])
    }
}
