
/*
 Structure :
 1. A swift structure is a construct that defines the building block of application.
 2. Structures are value type. There values are copied.
 3. Internally memory is managed. When copy a array instrucures the values are not copied at same time. Instead same object is used when other honor writes the value at that time the value is copied to new memory location.
 4. Structure also follows subscript
 5. Structures can follow protocol.
 */

/*
 Classes :
 1. Classes are also the building block of any programming language, so swift follows that rules.
 2. Modern day classes are equiped with Class Variables, First level Constructor (init), Second Level Constructor (ClassName()), Static variables, Local Variables, Inheritance, Inline Constructor Injection.
 3. Private keyword is there in swift but protected keyword is not there....
 */

/*
 Common between Structures & Classes
 1. Define properties to store values
 2. Define methods to provide functionality
 3. Define subscripts to provide access to their values using subscript syntax
 4. Define initializers to set up their initial state
 5. Be extended to expand their functionality beyond a default implementation
 6. Conform to protocols to provide standard functionality of a certain kind
 */

/*
 Classes over Strucures:
 1. Class supports inheritance
 */


import Foundation

//----------------------------------------BASICS------------------------------------------------
//class InnerClass;   //Decelerations are not allowed in swift.😝

// Follow default nomenclature (Start Class/Structure name with upper case)
class SwiftClass{
    // The real question arrises when will these variables get initilized?🧐
    // After reading some python docs things are little bit clear. Static variable is initilized at build time that is a simple C concept, but class variables are initialiesed then the object of class is created. Variables are initialise first then init is called. Which means that we cannot use self for class variables.
    // Python defines is more elegently that a class variable initialisation is a sequential process it goes with Class Variabled --> First constructor --> Second Constructor.
    // Class variables are meant to apply some state to class instance before some construct is being called.
    var classVar : String = "This is class variable"
    static var staticClassVar : String = "This is class static variable"
    private var privateClassVar : String = "Private class variable";
    
    
    
    // One must be insane with this..🤓🤓🤓
    static private var staticPrivateClassVar : String = "Static Private class variable";

    
    
    //var checkSelf:String = self.classVar; // A check to show that self cannot be used in class variable.
    
    
    
    // A sudo code to show the initialisation heirarchy of class.
    class InnerClass{
        var innerClassVar : String = "This is inner class string";
//        var copyVar : String = privateClassVar // Containership cannot use the private class variables. Inheritance can use it. Will see in Inheritance section.
        init() {
            print("Inner class is initialised : \(innerClassVar)")
        }
    }
    // Inner class is Initialized with this class variable initialisation
    var innerClass : InnerClass = InnerClass();
    
    
    
    
    //BUILD Time initialisation : This is not allowed in classes in swift. Only supported in structure. May be structures are value type anc classes are reference type. See the same in structure
    class MemberInitialisation{
        var member = "This is class member"
    }
    // This is not allowed in class
//    var memberInit = MemberInitialisation(member:"Member Initialisation");
    
    
    
    let c1 = InnerClass();
    func canModifyC1 (){
        // since classes are reference type so even if a class var is or constant (let) type but still its internal variables can me modified because class is reference type
        c1.innerClassVar = "Modified Inner class var";
        print("Modified inner class var \(c1.innerClassVar)");
    }
    
    
    
    func classCopy (){
        let c1 = InnerClass();
        let c2 = c1;
        
        c2.innerClassVar = "C2 has modified inner class var";
        print("C1.InnerClassVar :\(c1.innerClassVar)");
        print("C2.InnerClassVar :\(c2.innerClassVar)");
    }
    
    final class BaseClass {
        var baseClassProp : String = "Base Class property"
    }

    // cannot inherit from final class.
//    class DerivedClass:BaseClass{
//
//    }
    
    class CheckDInit {
        init() {
            print("This is class init")
        }
        deinit {
            //W-T-F why swift deinit.?????
            print("This is class deinit");
        }
    }
    
    
    init() {
        // This is swift initializer. But W-T-F this concept is generic in other programming languages, so why it claims that swift init🤬. A swift class life cycle does not supprt constructor. So only 1-level of constructor.
        //Kotlin and python has 2-level of initilisation init and Constructors
        print("Swift Class Initialisation")
    }
    init(param1:String, param2:Int){
        //init(); init cannot be called. 😝
        print("Custom init of class \(param1), \(param2)")
    }
    
    
    
    
    func printClass (){
        print("\(SwiftClass.staticClassVar)")
        print("\(SwiftClass.staticPrivateClassVar)")
        //print("\(SwiftClass.classVar)") This is build time error.
        print("\(self.classVar)")
        
        
        canModifyC1();
        
        
        var cDinit : CheckDInit? = CheckDInit();
        print("\(String(describing: cDinit))");
        cDinit = nil;
        
        
        classCopy();
        
        
        
        StaticClass.classMethod();
        StaticClass.staticMethod();
        
        let sc = StaticClass()
        sc.instanceMethod();
    }
    
    class StaticClass {
        static func staticMethod() {
            print("Hello from static methods");
        }
        class func classMethod() {
            print("Hello from class methods");
        }
        func instanceMethod() {
            print("Hello from instance methods");
        }
    }
}

struct SwiftStruct{
    var structVar : String = "This is struct variable"
    static var staticStructVar : String = "This is struct static variable"
    
    struct TestStructure{
        var i:Int;
    }
    
//    var checkSelf:String = self.structVar; // A check to show that self cannot be used in struct variable.
    
    
    struct InnerStruct {
        var structVar : String = "This is inner structure variable"
        init() {
            print("This is inner structure initialisation : \(structVar)");
        }
    }
    var innerStruct = InnerStruct();
    
    
    
    //Member initialisation
    // Structure has member wise initialisation. If we do not write init method then each property can be initiased when the instance is created. This feature is not present in classes.
    // All members should be initialised, otherwise Build time error.
    struct MemberInitialisation {
        var member : String = "Member initialisation"
//        private var privateMember : String = "Private member initialisation"
    }
    var memberInit = MemberInitialisation(member:"This is member initialistion in structure");
    // BUILD Time error, private members cannot be initialised in member function initialisation.
//    var memberInit = MemberInitialisation(member:"This is member initialistion in swift", privateMember:"Private member initialisation");
    

    // Since structs are value type so variables cannot be modified. The function needs to be mutating.
    var xInt : Int = 11;
    mutating func add1ToX (){
        // How does the mutating function is laid out in process memory calls???
        withUnsafePointer(to: &xInt) { print("\($0)") }
        xInt += 1;// this is compile time error because swift structures are value type so cannot be mutated. Needs to add mutating keyword in method
    }
    
    
    init() {
        print("Swift structure initialisation")
    }
    init(param1:String, param2:Int){
        print("Custom init of Struct \(param1), \(param2)")
    }

    
    
    mutating func printStructure(){
        print("\(SwiftStruct.staticStructVar)")
        //print("\(SwiftClass.classVar)") This is build time error.
        print("\(self.structVar)")
        print("\(self.memberInit.member)")
        
        

        // Printint the memory address, checking how a mutating function behave
        withUnsafePointer(to: &xInt) { print("\($0)") }
        add1ToX();
    }
    
}

//struct SwiftStruct : AnyObject{} : Inheritance is not allowed in structures.


//--------------------------------------CONTAINERSHIP----------------------------------------------

struct Point{
    var x:Double = -1.0;
    var y:Double = -1.0;

    func printCoordinates (){
        print("(X,Y) = (\(x),\(y))");
    }
}

class Quadilateral{
    // same as C++ for private. Only accessed by member functions.
    private var pointA : Point = Point(x:0, y:0);
    private var pointB : Point = Point(x:0, y:2);
    private var pointC : Point = Point(x:2, y:2);
    private var pointD : Point = Point(x:2, y:0)
    
    func printCoordinates (){
        pointA.printCoordinates();
        pointB.printCoordinates();
        pointC.printCoordinates();
        pointD.printCoordinates();
    }
    
    init() {
        // accessing private function. Only accessible by class.
    }
    
    func plusOne (){
        pointA.x = pointA.x + 1;
        pointA.y = pointA.y + 1;

        pointB.x = pointB.x + 1;
        pointB.y = pointB.y + 1;

        pointC.x = pointC.x + 1;
        pointC.y = pointC.y + 1;

        pointD.x = pointD.x + 1;
        pointD.y = pointD.y + 1;
        
        printCoordinates();
    }
}
//----------------------------------------------------------------------------------------
