//
//  MemoryLevel2.swift
//  SwiftLearning
//
//  Created by Gagan on 16/07/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation


class MemoryLevel2
{
    class Person{
        var name: String
        var friends: [Person] = [];
        
        init(name: String) {
            self.name = name;
        }
        
        deinit {
            print("Name : ", self.name);
            print("Friends : ", self.friends);
        }
    }
    
    func debugAll(){
//        debugPersons();
        debugDefer();
    }
    
    func debugPersons(){
        do{
            let p1 = Person(name: "P1");
            let p2 = Person(name: "P2");
            
            p1.friends.append(p2);
            p2.friends.append(p1);
        }
    }
    
    func debugDefer() {
        
        func increment() -> Int{
            var value : Int = 1;
            defer {
                value += 1;
                print("Calling from Defer : \(value)");
            }
            return value;
        }
        
        let res = increment();
        print("Result : \(res)");
    }
}
