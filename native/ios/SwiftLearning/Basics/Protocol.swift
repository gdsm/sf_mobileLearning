/*
 1. Protocol cannot be nested in class
 2. A protocol can inherit protocol only not class
 3. Extensions can follow protocols
 */

import Foundation


protocol InstanceProtocol {
    func method () -> String;
    // this propery is having can be read write. It can be both computed or stored.
    var getSetProp : String {get set}
    // a read only property defined by protocol
    var getProp : String {get}
}

protocol  StaticProtocol {
    // class methods are not allowed in protocol use static keyword. Build Time error
//    class func classMethod () -> String
    static func staticMethod () -> String
    
    static var getSetProp : String {get set}
    static var getProp : String {get}
}

protocol MutatingProtocol {
    
    // this is for structures only because they are value type.
    mutating func mutatingProtocol();
}

protocol BaseProtocol {
    
}

protocol DerivedProtocol1 : BaseProtocol {
    
}

protocol DerivedProtocol2 : BaseProtocol {
    
}


//extension Array: BaseProtocol where Element: BaseProtocol {
//    // protocol can be used with generics by using where clause
//    // if array element correnpond to Base Protocol then Array class can also correspond to BaseProtocol
//}

extension BaseProtocol{
    // protocols can be extended
}



protocol ClassOnlyProtocol_0 : AnyObject , BaseProtocol{
        // this protocol cannot be used with structures, enumerations
}

protocol ClassOnlyProtocol_1 : Any , BaseProtocol{
    // this protocol cannot be used with structures, enumerations
}




protocol ProtocolOverStruct {
    var isTrue: Bool {get set}
}

@objc protocol A {
    @objc optional
    func foo()
}

extension A {
    func foo() {
        print("A foo")
    }
}

@objc protocol B {
    @objc optional
    func foo()
}

extension B {
    func foo() {
        print("B foo")
    }
}


class Protocol{
    
    class ClassInstanceProtocol : InstanceProtocol{
        
        var getProp: String {
            get {
                return "This is getter from protocol read only property"
            }
        }
        
        var getSetProp: String = "Getter/Setter property defined in protocol"
        
        func method () -> String {
            return "This is protocol method in class instance variable."
        }
    }
    
    class ClassProtocol : StaticProtocol{
        
        static var getSetProp: String = "Static protocol getter setter property"
        
        static var getProp: String {
            get{
                return "Static procol getter property"
            }
        }
        
        
        static func staticMethod() -> String {
            return "Class protocol : Static Method"
        }
    }
    
    struct StructProtocol : MutatingProtocol {
        var property : String = "This is structure property";
        
        // no need to write mutating again, but a mutating function can be change to non mutating function while implementation.
//        nonmutating func mutatingProtocol(){
//        }
        mutating func mutatingProtocol() {
            property = "Property changes in structure after mutating method";
        }
        
        func printAll (){
            print(property)
        }
    }
    
    
    class ClassOnly : ClassOnlyProtocol_0{
    }
    class ClassOnly1 : ClassOnlyProtocol_1{
        //Any can be used.
    }

    
    // Build time error. Cannot use with structures.
//    struct StructOnly : ClassOnlyProtocol_0{
//
//    }
    struct StructOnly : ClassOnlyProtocol_1 {
        // Since Any is used this can ba used with structures.
    }
    
    
    
    
    class ProtocolOverStruct_Class: ProtocolOverStruct {
        var isTrue: Bool {
            get{
                return true
            }set {
                // nothing
            }
        }
    }
        
    class AB: A, B {
        func foo() {
            print("Class AB foo")
        }
    }

    func debugAll () {
        
        let a : A = AB()
        a.foo()
        let b : B = AB()
        b.foo()

        // can create instance of type protocol
        let ip : InstanceProtocol = ClassInstanceProtocol();
        print(ip.method())
        print(ip.getSetProp)
        print(ip.getProp)
        
        print("----------------------")

        // prtocol support static methods, which means that a new design pattern type 😀
        print(ClassProtocol.staticMethod());
        print(ClassProtocol.getSetProp)
        print(ClassProtocol.getProp)
        
        print("----------------------")

        var sp = StructProtocol();
        sp.printAll();
        sp.mutatingProtocol();
        sp.printAll();

        print("----------------------")
        
        // 'is' typecasting can be used on protocols also.
        class DerivedClass1Protocol : DerivedProtocol1{
        }
        class DerivedClass2Protocol : DerivedProtocol2{
        }
        var protArray : [BaseProtocol] = [BaseProtocol]()
        protArray.append(DerivedClass1Protocol())
        protArray.append(DerivedClass2Protocol())
        
        for baseProt in protArray
        {
            if (baseProt is DerivedProtocol1){
                print("Instance is of type Derived protocol 1")
            }
            else if (baseProt is DerivedClass2Protocol){
                print("Instance is of type Derived protocol 2")
            }
        }
        
        print("----------------------")

    }

}
