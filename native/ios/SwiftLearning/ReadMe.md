/*
GDSM : My Swift Notes
*/

/******************************************************
------------- Swift Internals ------------

* A more load on compiler. C-Compiler knows a variable is of what type (int, float, double). But Swift is a dynamic/weak type language to needs compiler needs to handle more work on the other hand c, cpp is strong typed language
* Swift is compiler based language not like python which is interepretor based languages.
* https://www.infoworld.com/article/3247799/development-tools/what-is-llvm-the-power-behind-swift-rust-clang-and-more.html
* REPL : Real Time print Loop . Platform that playgrounds uses.


* Swift is a language and LLVM is the compiler both are seperate entities. it seems that swift gives some sought of Low-Level-Swift code to LLVM and LLVM has also upgraded itself to understand that Low-Level-Swift Code which converts it to machine code.
* Swift is a dynamic typed language. Means that variable needs value at the time then they are defined. Similar to kotlin, python
* Swift is compiled to machine-code by LLVM-bit code. Swift does not need objective-c runtime this conclude that swift is not build on above of objective-c wrapper. In the case of JAVA the code is compiled to machine code for JIT (JVM) and JVM runs the code on actual machine.
*******************************************************/

/******************************************************
---------- Swift Language Concepts -----------

$ Pacakage Manager : This is module used to compile the swift code in a executable format.code
1. create a swift file in a directory
2. swift package init --type executable
3. swift build
4. swift run

This above steps will build and create a executable file for swift.

Observation: Swift is no dependent on the main function. Execution cycle of swift is module dependent which means that the swift execution should have atleast main.swift file no need for main function.
Unless C/CPP where we need to make cmake, qmake files for compiler executions here swift module is bundled in pacakage and that pacakage has one executable.and

Questions : How to change the architecture for swift package. COnsidering embedded side swift or server side swift how to change the architecture?


Siwft has class variables concept but it has only one level of constructor only init constructor not the class construtor like kotlin..

*******************************************************/

/// >>>>> CommandLine arguments:
// Command line arguments are accessed by following apis.
let args : [String] = CommandLine.arguments;
let argc : Int32 = CommandLine.argc;



/// Constants


/// >>>>>> Strings

// A sample testing string
var testString : String = "Hello"

// get the index from the string (String.Index)
let index : String.Index = testString.index(testString.startIndex, offsetBy: 2)
testString.remove(at: index)
testString

// Observe closely ... includes the upper bounds then the variable would be of type Closed Range otherwise the variable is of type Range.
testString = "Hello"
// String Range With starting Index
let rangeFromStart = testString.startIndex..<testString.index(testString.startIndex, offsetBy: 2)
// String Range With ending Index
let rangeFromEnd = testString.index(testString.endIndex, offsetBy: -2)..<testString.endIndex
testString.removeSubrange(rangeFromStart);

//Reserved the storage for the string.
testString = "Hello"
testString.reserveCapacity(100);


/// >>>>>> Arrays
let array1 = [1,2,3]
//var array2 : Array<Int> = [2.1,2.3,2.4] -- Type conversion compiler error
var array2 : Array<Double> = [2.1,2.3,2.4]
for i in array1{
print(i);
}
//array.append(4) ---- compiler error out of bound
for i in array2.reversed(){
print(i)
}


/// >>>>>> Functions
func sayHello (name : String){
print("Hello\(name)")
}
sayHello(name: "World")

