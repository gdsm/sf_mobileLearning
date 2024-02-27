
/*
 1. Multiple line strings must start from new line.
 */

import Foundation

class StringLiterals{
    
    let multipleLineString = """
                                This \
                                is \
                                multiple \
                                line \
                                string
                            """
    
    func debug (){
        print("Multiple line string : \(multipleLineString)");
        subString()
        traverseString()
        subScrintSlice()
        reverse()
    }
    
    func subString() {
        let s = "abcdefghijklmnopqrstuvwxyz"
        for i in 0..<s.count {
            let range = s.index(s.startIndex, offsetBy: i)
            print("\(s[range..<s.endIndex])")
        }

        for i in 0..<s.count {
            let range = s.index(s.endIndex, offsetBy: -i)
            print("\(s[s.startIndex..<range])")
        }
    }
    
    func subScrintSlice() {
        let s = "This is a long String"
        let si = s.index(s.startIndex, offsetBy: 4)
        let ei = s.index(s.startIndex, offsetBy: 7)
        let slice = s[si..<ei]
        print("Slice \(slice)")
    }
    
    func traverseString() {
        "abcdef".forEach { (c) in
            if c == Character("a") {
                print("Wow A")
            }
        }
    }
    
    func reverse() {
        let s = "ABCD"
        let r = s.reduce("") {
            print("\($0) : \($1)")
            return "\($1)" + $0
        }
        print(r)
    }
}
