/*
 1. Used to flatten the collection.
 */

import Foundation

class FlatMaps{
    
    class Collection{
        
        let collection = [["abc", "def"], ["ghi", "jkl"]]
        
        func flatCollection () {
            let nc1 : Array<Character> = collection.flatMap({(col1arg:[String]) in
                                return col1arg.flatMap({(col2arg:String) in
                                    return col2arg.uppercased();
                                })
                        })
            print("Flat Collection \(nc1)");
            
            let nc2 = collection.flatMap{$0.map{$0.uppercased()}}
            print("Compact Map Collection \(nc2)");

            // this is returning Array<[String]>. Maps are for single level of heirarchy.
            let mapCollection : Array<[String]> = collection.map({(col1arg:[String]) in
                return col1arg.map({(col2arg:String) in
                    return col2arg.uppercased();
                })
            })
            print("Map Collection \(mapCollection)")
        }
        
        func nilFlatMap ()
        {
            // float map only traverse over non-nil values
            let collection = ["swift", nil, "is", nil, "awesome"];
            
            let fc1 = collection.flatMap{return $0}
            print("Flat Map : \(fc1)");
        }
        
        func printAll (){
            print("old Collection \(collection)");
            flatCollection();
            nilFlatMap();
        }
    }
    
    func debugAll (){
        print("------------------------------")
        let c = Collection();
        c.printAll();
    }
    
}
