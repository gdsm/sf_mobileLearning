/*
 1. In swift structures and enumerations also supports methods.
 2. Methods are assosicated by type.
 3. Instance Methods are methods associated with instance of a type.
 4. Usage of method in Enums is not straight forward. They are used in the form of recusion.
 */

import Foundation

enum EnumMethods{
    func instanceMethod() {
        print("This is enum instance method")
    }

    func debugAll() {
        instanceMethod();
    }
}

struct StructureMethods{

    var x:Int = 1;
    
    func instanceMethod() {
        print("This is structure instance method")
    }
    
    static func typeMethods() {
        print("This is structure type method")
    }
    
    // cannot be used with struct.
//    struct func type2Method() {
//        print("Yet another structure type method")
//    }
    
    // Build time error. Static function cannot be mutating
//    static mutating func staticMutating (){
//    
//    }
    
    mutating func deltaX (delta:Int){
        x += delta;
        self = StructureMethods(); // 😝
        //mutating can also modify self. 🤓🧐🤓🧐🧐 Strange
    }
    
    func debugProperties (){
        print("X : \(x)");
    }
    
    func debugAll() {
        instanceMethod();
        StructureMethods.typeMethods()
    }
}

class ClassMethods{
    
    // General OOPS concept.
    // this cannot be used in static method
    var iVar : String = "Instance Var";
    // this can be used in static method
    static var sVar : String = "Static"
    
    func instanceMethod() {
        print("This is class instance method")
    }
    
    static func typeMethods() {
        print("This is class type method")
    }
    
    class func type2Method (){
        print("Yet another class type method")
    }
    
    var sMethod = StructureMethods();
    
    var x : Int = 2;
    func deltaX (delta:Int){
        x += delta; // mutating is not valid for classes because classes are reference type.
    }
    
    @discardableResult
    func returnBool (i:Int) -> Bool {
        if ((i % 2) == 0){
            return false;
        }else{
            return true;
        }
        // no need to return. @discardableResult is used
    }
    
    func testOptionalArg (requiredArg:String, _ optArg:String){
        print("Optional Argument : \(optArg)")
        print("Required Argument : \(requiredArg)")
    }

    func debugAll() {
        instanceMethod();
        ClassMethods.typeMethods()
        ClassMethods.type2Method();
        
        sMethod.debugProperties();
        sMethod.deltaX(delta: 1);
        sMethod.debugProperties();
        
        print("X : \(x)");
        deltaX(delta: 1);
        print("X : \(x)");
        
        testOptionalArg(requiredArg:"Required Argument", "Optional Argument");
    }
}
