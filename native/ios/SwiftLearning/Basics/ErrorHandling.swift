
import Foundation

class Errors{

    enum ErrorEnum : Error {
        case Err1, Err2, Err3
    }
    
    func canThrowError() throws -> Bool{
        
//        let opt : String? = nil;
//        let fix : String = opt!;

        throw ErrorEnum.Err1;
        return false;
    }
    
    func debug (){
        do{
            let _ : Bool = try canThrowError();
            
        }catch ErrorEnum.Err1{
            print("Error 1")
        }catch ErrorEnum.Err2{
            print("Error 2")
        }catch ErrorEnum.Err3{
            print("Error 3")
        }catch {
            
        }
        
        assertions();
    }
    
    func assertions (){
        let age = -2;
        assert(age > 0, "Age cannot be less then 0");
    }
}
