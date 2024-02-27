//
//  BinaryGap.swift
//  SwiftLearning
//
//  Created by Gagan on 15/05/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation


class BinaryGap {
    
    public func solution(_ N : Int) -> Int {
        // write your code in Swift 4.2.1 (Linux)
        let binStr = String(N, radix: 2)
        var zerosArray = binStr.components(separatedBy: "1");
        if let last = binStr.last {
            if (last == "0")
            {
                zerosArray.removeLast();
            }
        }
        var max = 0;
        let _ = zerosArray.map({
            max = ($0.count > max) ? $0.count : max;
        })
        return max;
    }
    
    func debugAll(){
        for i in 9999..<10100{
            print("{Int Number -> \(i)} {Binary -> \(String(i, radix: 2))} {Gap -> \(solution(i))}");
        }
    }
}
