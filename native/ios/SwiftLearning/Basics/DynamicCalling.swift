//
//  DynamicCalling.swift
//  SwiftLearning
//
//  Created by Gagandeep Madan on 18/09/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation

@dynamicCallable struct DyStruct {

    func dynamicallyCall(withKeywordArguments: KeyValuePairs<String, Int>) -> Int {
        
        for k in withKeywordArguments {
            print("Key \(k.key) : Value \(k.value)");
        }
        
        return 0;
    }

}

class DynamicCalling {
    
    func debugAll() {
        let dS = DyStruct()
    }
}
