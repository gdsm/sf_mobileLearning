//
//  SwiftObjcComm.swift
//  SwiftLearning
//
//  Created by Gagandeep Madan on 16/09/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation


struct SwiftObjcCommStruct {
    
    func callSwiftStruct(tupple: (Int, String)) {
        print("In Swift Tupple \(tupple.0), \(tupple.1)");
    }
}

@objc enum SwiftObjcCommEnum: Int, RawRepresentable{
    case type1
    case type2
}

@objc class SwiftObjcComm : NSObject{
    
    func debugAll() {
        
        self.usingObjc();

        if nil == .none {
            print("nil and  none are passed");
        }
        
        let _ = ObjcSwiftComm().debugAll();
    }
    
    
    func usingObjc() {
        let o = ObjcSwiftComm();
        print("Objc String \(o.objcString)")
        
        let e  = ObjcEnumType.objc1;
        print("Objct Enum \(e.rawValue)")
    }
    
    @objc func getSwiftDictionary() -> [String:AnyHashable] {
        let sd = ["Key_1":1, "Key_2":2];
        return sd;
    }
    
    @objc func getSwiftTuple() -> Dictionary<String, AnyHashable> {
        //ERROR: Method cannot be marked @objc because its result type cannot be represented in Objective-C
        //Resolution : Convert to dictionary or use closure.
        var r = Dictionary<String, AnyHashable>();
        r["key1"] = 1;
        r["key2"] = "2";
        return r;
    }

    func getSwiftTuple() -> (Int, String) {
        //ERROR: Method cannot be marked @objc because its result type cannot be represented in Objective-C
        //Resolution : Convert to dictionary or use closure.
        return (1, "2");
    }

//    @objc func getSwiftStruct() -> SwiftObjcCommStruct {
//        //ERROR: Method cannot be marked @objc because its result type cannot be represented in Objective-C
//        //Resolution : Conversion is required.
//        let r = SwiftObjcCommStruct();
//        return r;
//    }
    
    @objc func getSwiftEnum() -> SwiftObjcCommEnum {
        //ERROR: Method cannot be marked @objc because its result type cannot be represented in Objective-C
        //Resolution : By declaring the enum as @objc and Int, RawRepresentable this can be parsed in objc
        let r = SwiftObjcCommEnum.type1;
        return r;
    }
}
