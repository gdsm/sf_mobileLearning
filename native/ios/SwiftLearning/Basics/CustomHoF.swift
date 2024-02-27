//
//  CustomHoF.swift
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 03/10/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

import Foundation


fileprivate extension Array {
    func traverse<T>(_ transform: (Element) -> T) -> [T] {
        var retVal: [T] = []
        for i in self {
            retVal.append(transform(i))
        }
        return retVal
    }
}


class CustomHoF {
    func debug() {
        let val = [1, 2, 3].traverse { (i) -> Int in
            return i+1
        }
        print(val)
    }
}

