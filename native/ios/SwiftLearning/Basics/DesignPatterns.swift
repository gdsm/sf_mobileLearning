//
//  DesignPatterns.swift
//  SwiftLearning
//
//  Created by Gagan on 06/05/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation

class DesignPatterns{
    
    class KVO: NSObject{
        var name:String = "Old" {
            didSet{
                
            }
            willSet{
                
            }
        }
        
        func test() {
        }
    }
    
    
    
    func debugAll() {
        let kvo = KVO();
        kvo.test();
    }
    
}
