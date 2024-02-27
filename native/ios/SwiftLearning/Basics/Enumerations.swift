
/*
 1. Siwft enums are not like C/C++. Integer constants are not assigned Enums do not start with 0,1,2,3,
 2. Enum varibles are also hashable.
 3. Swift Enums can be of type String, Tuple, Int
 4. Swift Enums can be initialized with Raw Values
 5. Swift Enums can also be recursive. Function, closure, expression calls can be made in case statements.
 */

import Foundation

// These are global level enums.
// Enumnerations can be declared by any of the following types
enum Directions{
    case east, west, north, south
}

enum SubDirections{
    case northeast
    case northwest
    case southeast
    case southwest
}

// enum as union.
enum Dot{
    case coordinate(Int, Int)
    case color(String);
}

// This is Raw Type Enum. This is not inheritance it is intended to tell that the enum values are preloaded with string type values.
// Values must be unique inorder to compute hashValue.
// This is not the associated value.
enum RawValueInitialisation : String{
    case rawVal1 = "100"
    case rawVal2 = "200"
    // Raw Values can be implicitely assigned also. For integers it is the next sequence number for strings it is same as the case name.
    case rawVal3
}
enum IntRawValueInitialisation : Int{
    case rawVal1    // for this the default value is 0
    case rawVal2 = 2
    case rawVal3
}

struct StructEnum {
    // scope is inside strucure
    enum OperatingSystem {
        case android
        case iOS
        case windows
    }
}

class ClassEnum{
    // scope is inside class
    enum OperatingSystem {
        case android
        case iOS
        case windows
    }
    
    typealias ArthematicExpression = (Int, Int) -> Int;

    func subtractExpresion (i:Int, j:Int) -> Int{
        return i-j;
    }
    
    indirect enum Expression{
        case addition(ArthematicExpression)
        case subtraction(ArthematicExpression)
    }
}

class StudentReport {
    
    enum Student {
        case Name(String)
        case Mark(Int,Int,Int)
        
        func avegage() {
            
        }
    }
    
    var studDetails = Student.Name("Swift")
    var studMarks = Student.Mark(98,97,95)
        
    func debugAll() {
        switch studMarks {
        case .Name(let studName):
            print("Student name is: \(studName).")
        case .Mark(let Mark1, let Mark2, let Mark3):
            print("Student Marks are: \(Mark1),\(Mark2),\(Mark3).")
        default:
            print("Nothing")
        }
    }
    
}


class Enumerations{
    
    func debugAll () {
        printDirections();
        enumTypes();
        classEnums();
        structEnum();
        printRawValue();
        printIntRawValue();
        
        printIndirectEnumeration();
        
        let sr = StudentReport();
        sr.debugAll();
        
        let dot : Dot = Dot.coordinate(0, 1);
        print("Dot :\(dot)");
        print("Dot Type :\(type(of: dot))");
    }
    
    func printDirections (){
        print("Direction.East: \(Directions.east)");
        print("Direction.West: \(Directions.west)");
        print("Direction.North: \(Directions.north)");
        print("Direction.South: \(Directions.south)");

        print("SubDirections.East: \(SubDirections.northeast)");
        print("SubDirections.West: \(SubDirections.northwest)");
        print("SubDirections.North: \(SubDirections.southeast)");
        print("SubDirections.South: \(SubDirections.southwest)");
    }
    
    func enumTypes (){
        let a : Directions? = nil;
        print("Type of Directions\(type(of: a))");
    }
    
    func classEnums (){
        print("Class Enum \(ClassEnum.OperatingSystem.android)");
        print("Class Enum \(ClassEnum.OperatingSystem.iOS)");
        print("Class Enum \(ClassEnum.OperatingSystem.windows)");
    }
    
    func structEnum (){
        print("Struct Enum \(StructEnum.OperatingSystem.android)");
        print("Struct Enum \(StructEnum.OperatingSystem.iOS)");
        print("Struct Enum \(StructEnum.OperatingSystem.windows)");
    }
    
    func printRawValue (){
        //.raw value accessor is only exposed then the enum is defined as raw value type.
        print("RawValue \(RawValueInitialisation.rawVal1.rawValue)")
        print("RawValue \(RawValueInitialisation.rawVal2.rawValue)")
        print("RawValue \(RawValueInitialisation.rawVal3.rawValue)")
    }
    
    func printIntRawValue (){
        print("Int RawValue \(IntRawValueInitialisation.rawVal1.rawValue)")
        print("Int RawValue \(IntRawValueInitialisation.rawVal2.rawValue)")
        // Int Raw value is auto assigned with the sequence.
        print("Int RawValue \(IntRawValueInitialisation.rawVal3.rawValue)")
        
        //Raw value initializer is activated when enum is set to be intializer ;
        let val = IntRawValueInitialisation(rawValue : 7);
        print("Custom Value : \(String(describing: val))");
    }
    
    func printIndirectEnumeration(){
        
    }

}
