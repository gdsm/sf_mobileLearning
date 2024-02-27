/*
 1. Properties are of kind store or computed.
 2. Stored Properties : value is computed/assigned at the time of assignment. I am specific wiht my words VALUE IS COMPUTED. By this i means at the time of assignment.
 3. Computed Properties : Value is assigned at the time of requirement. When it is required the property computes values and assigned.
 4. Computed properties is like overriding getter/setter. For professional coding one should be very specific in selecing a property type.
 5. A pratical experience rule : Avaoid computed properties for UI elements. Any platform has a life-cycle for UI tree/heirarchy all UI initialisation/allocations needs to be performed in that to give best performance becuase OS is in that context and operations are queued on main thread. For example : iOS Initialize UI elements in ViewDidLoad because at that time UI thread is on priority, if done on getters the thread context might have changed and some non-ui thread might be on priority. This might blunder the OS timings. And in context of RTOS this is a major blunder.
 6. Lazy Stored Properties : There values are calculated when first time they are used. using var as lazy is a good practice, using let as lazy is bad practice.
 7. Best practice for computed properties : Use them for calculations. You can't rely on the previously stored calculated value every time a buisiness calculation starts you need updated calculations. But with this make sure while financial calculations they should be computed initially, in-between of calculation they should not be re-computed.
 8. Static properties can also be computed properties
 9. Swift does not have register/extern type properties .... WHY ??, WHATS THE REASON?? WHATS THE ALTERNATIVE??
 */

import Foundation

class Properties{
    
    // stored Properties
    struct Point {
        var x:Int = 0
        var y:Int = 0
    }
    let pt = Point();
    
    class Line{
        var a = Point();
        var b = Point();
        
        func printPoints(){
            print("\(a)")
            print("\(b)")
        }
    }
    let line = Line();
    
    class LazyLine : Line{
        override init() {
            print("Lazy Line Initialisation")
        }
    }
    lazy var lazyLine = LazyLine();
//    lazy let lazyLineC = LazyLine(); // Build Time error : Lazy cannot be applied on constants

    
    struct Rectangle {
        private var a : Point = Point(x:0, y:0);
        private var b : Point = Point(x:4, y:0);
        private var c : Point = Point(x:4, y:2);
        private var d : Point = Point(x:0, y:2);

        
        // computed read-only property, because we have no written setter.
        var length : Int {
            get{
                return (c.x - a.x);
            }
            set{
                // By default the variable in newValue
                c.y = newValue;
            }
        }
        var width : Int {
            get{
                return (d.y - a.y);
            }
            set (w){ // setting custom variable..
                d.y = w;
            }
        }
        
        var area : Int {
            get{
                return (length*width);
            }
        }
    }
    var rect = Rectangle()
    
    
    // computed properties must specify type.
    var testProp : String = ""{
        // set cannot be used with didSet/willSet
        // these are called property observers
        didSet{
            print("Test property did set\(testProp)")
        }
        willSet{
            print("Test property will set\(testProp)")
        }
    }
    
    func debugAll(){
        printStoredProperties();
        printComputedProperties();
        
        testProp = "Hi, I am setting property"
    }
    
    func printStoredProperties(){
        print("\(pt.x)")
        print("\(pt.y)")
        
//        pt.x = 1; // Build Time error pt is a stored property and or constant type and x is a variable. So by default as per structure in swift is value type so internal values would also be constant.
        line.a.x = 1; // this is valid in class. Because classes are reference type.
        line.printPoints();
        
        //lazyLine.printPoints(); // Comment the line and see the init is not called.
    }
    
    func printComputedProperties (){
        print("\(rect)"); // Area will not printed becuase that needs to access.
        print("\(rect.area)")
    }
}
