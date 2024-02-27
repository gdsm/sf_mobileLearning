/*
 1. Follows OOPS concepts.
 2. Subscripts can also be inherited.
 3. Will look at how much concepts swift follows of OOPS.
 4. By Default inheritance in swift is public.
 5. Private classes can also be written.
 6. Swift is crazy with private methods can be called from the instance.
 7. For second level of constructor swift provides conviennce initializer.
 */

import Foundation


class Inheritance{

    struct Object {
        var object : String = "";

        func printAll (){
            print("Object Class \(object)");
        }
    }
    
    // swift classes do not inherit from universal base class. Unlike kotlin, NSObject.
    // writing some printing logic : Go throught the print output closely. See the order of printing.
    class BaseClass{
        var baseClassProp = "This is base class property"
        var baseObj = Object(object: "Initialized from Base Class")
        
        // similarly final subscript cannot be overriden
        final var finalProp = "This is final property in base class and cannot be overridden";
//        final lazy let finalLazyLetProp = "This cannot pe used.";

        init() {
            print("Hi!! This is Base class")
        }
        
        init(param : String) {
            print("Initilialising Base class with param : \(param)")
        }
        
        subscript (index : Int) -> String{
            get{
                return "Returning Base class Subscript"
            }
        }
        
        final subscript (index : Int, atom : Int) -> String{
            get{
                return "This is final subscript"
            }
        }
        
        func printAll () {
            //super.init(); // Cannot call super, because there is no super class of BaseClass.
            print("\(baseClassProp)");
        }
    }
    
    
    class DerivedClass : BaseClass{
        var derivedClassProp = "This is derived class property"
        var derObj = Object(object: "Initialized from Derived Class")
        
        // compile time error, final prop cannot be overridden
//        override var finalProp : String {
//
//        }
        
        // properties can also be overriden with using overrode keyword, computed properties can be overridden not stored properties.
        // Attributes of properties must remain same (Type, Optional)
        override var baseClassProp : String {
            get{
                return "baseClassProp : Getter overriden in Derived class"
            }
            set (newValue){
                print("😝 Just for learning, will not set any value, baseClassProp setter called in derived class.")
            }
        }

        override init() {
            // super.init can be called only once.
//            super.init();
            super.init(param: "From Derived Class calling super init with param")
            print("Hi!! This is Derived class")
        }
        
        override subscript (index : Int) -> String
        {
            get{
                return "Returning derived class subscript"
            }
        }

//        compile time error
//        override final subscript (index : Int, atom : Int) -> String {
//            get{
//                return "😝😝😝😝😝😝 Cannot use final in derived class subcript"
//            }
//        }
        
        override func printAll () {
            super.printAll();
            print("\(derivedClassProp)");
            print("\(baseClassProp)");
        }
    }
    
    
    
    // if base class is private then derived class must also be private.
    private class BaseScopeClass{
        var baseProp = "This is base class property"
        
        func privateFunction (){
            print("This is private function");
        }
    }
    
    private class DerivedScopeClass : BaseScopeClass{
        let derivedProp = "Derived class property";
        
        func printAll(){
            print("Derived class prop \(derivedProp)");
            baseProp = "Base class prop modified in derived class."
            print("Base class prop \(baseProp)");
            print("Derived class prop \(derivedProp)");
        }
    }
    
    
    struct BaseStruct {
        
    }
    // structures cannot be inherited
//    struct DerivedStruct : BaseStruct{
//
//    }
    
    func debugAll (){
        let dc = DerivedClass();
        dc .printAll();
        
        
        let dc2 = DerivedScopeClass();
        dc2.printAll();
        // this is insane in swift why a private class functions is getting called from here.
        dc2.privateFunction();
    }
}


@objc class Sample: NSObject {
    
}
