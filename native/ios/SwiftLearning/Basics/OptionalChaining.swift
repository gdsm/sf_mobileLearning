/*
 1. Optional Chaining is a way to access optional values.access
 2. Force unwrapping is also a away but if the value is nil the application will crash at runtime.
 3. Return value from optional chaning is always optional value.
 4. If a nil is found the subsequent nil is returned.
 5. Optional chaining is safe as compared to forced unwrapping
 */

import Foundation


class OptionalChaning{
    
    class Object1{
        // an optional object , default value is nil
        var optVal : Int?
        var nonOptVal : Int = 10

        func optionalMethod (param : Bool) -> Int?{
            if (param){
                return optVal;
            }
            return nil;
        }
        
        subscript (i : Int) -> Int? {
            get{
                return optVal;
            }
        }
        
        func printAll (){
            // print API is not taking optional value this might not be safe, so it is packaged inside a String
            print("optVal \(String(describing: optVal))")
            print("nonOptVal \(nonOptVal)")
        }
    }
    
    class Controller {
        // an optional object , default value is nil
        var object : Object1?
    }
    
    func debugAll (){
        let c = Controller();
        
        // Optional value is always return optional value so assignment type should be ?
        var optVal : Int? = c.object?.optVal;
        var nonOptVal : Int? = c.object?.nonOptVal;
//        var optInNonOpt : Int = (c.object?.optVal)! // this will result in crash. That is why for force unwrapping needs to be careful
        
        print("optVal \(String(describing: optVal))")
        print("nonOptVal \(String(describing: nonOptVal))")
        // printing above will show nil because object is optional and we have not assigned any value.
        
        // now assigning optional value
        c.object = Object1();
        optVal = c.object?.optVal;
        nonOptVal = c.object?.nonOptVal;
        
        print("optVal \(String(describing: optVal))")
        print("nonOptVal \(String(describing: nonOptVal))")
        // ? in subscript should be before bracket
        print("Accessing subscript \(String(describing: c.object?[0]))")
        
        c.object?.optVal = 20;
        optVal = c.object?.optVal;
        nonOptVal = c.object?.nonOptVal;
        print("optVal \(String(describing: optVal))")
        print("nonOptVal \(String(describing: nonOptVal))")
        print("Accessing subscript \(String(describing: c.object?[0]))")

        print("Optional method \(String(describing: c.object?.optionalMethod(param: false)))")
        print("Optional method \(String(describing: c.object?.optionalMethod(param: true)))")
    }
}
