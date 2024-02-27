//
//  SwiftCore.swift
//  SwiftLearning
//
//  Created by Gagan on 23/04/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation
import Swift

public func == (lhs: (), rhs: ()) -> Bool
{
    print("Swift Core Function");
    return true;
}

class SwiftCore {
    
    func debugAll() {
        testOverLoading();
    }
    
    private func testOverLoading() {
        let o = Overloading();
        print("Is equal : \(o==o)");
    }
}

class Overloading: Equatable{
    static func == (lhs: Overloading, rhs: Overloading) -> Bool {
        print("Class Core Function");
        return true;
    }
}
