
/*
 Optionals:
 1. Value can be absent at any time of variable life cycle.
 2. Optionals has 2 states : Either the value is there needs to unwrap that  or the value is not there.
 3. The concept of optionals does not exist in c, cpp, objective-c. Objective-C supports nul return types but that too only for Object Classes not for strucures, enums, etc... Where as swift supports for all.
 4. nil = A special state for optional variables to set them value less..
 5. Objective-C nil is a 0x0000 pointer where as in context of swift nil is absence of value to a variable..
 6. nil in swift is not a
 7.  NSNull is a objective-c class inherited fron NSObject.
 8. CFNull is a objective-c class inherited from nothing.
 
 9. Force Unwrapping : Sure that optional has a value forcefully decodes it.
 10. '!' : keyword is implecit unwrap optionals. Use the implicit optional when you are 100% sure that there is some value otherwise check the optional binding or if else.
 */

import Foundation

enum myEnum{
    case a, b, c
}

struct Struct1 {
    // Follow Nomenclature start property name with lowercase
    let val : Int = 12345;
    init() {
        print("Initialising structures");
    }
}

class Optionals{
    
    var optionalInt : Int? = 100;
    var int : Int = 100;
    let z : myEnum? = nil;
    let b : Bool? = nil;

    func debug(){
        print("\(optionalInt)");
        optionalInt = nil;
        print("\(optionalInt)");
        //int = nil; // Compiler Error : nil callnot be assigned
        print("Int \(int)");
        
        var a : String? = "A String";
        print("Optional Value : \(a)")
        print("Force Un-Wrap : \(a!)")
        
        //Uncomment the below lines and observe the error.
        //a = nil;
        //print("Force Un-Wrap : \(a!)") // Run-time Error : Fatal Error
        
        print("Enum : \(type(of: z))");

        let s : Struct1? = nil;
        print("Struct \(s)");

        optionalBinding();
    }
    
    func optionalBinding () {
        var someString : String? = "A nice sunny day";
        
        
        //temp is only avaliable inside if statement even not in else.
        if let temp = someString {
            print("1. : \(temp)");
        }
        
        someString = nil;
        if let temp = someString {
            print("2. : \(temp)");
        }
    }
}
