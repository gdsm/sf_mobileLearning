import Foundation

guard let std_input_1 = readLine() else {
    fatalError("Bad input");
}

let str_inputs = std_input_1.split(separator: " ").map({String($0)});

guard let num_of_items = Int(str_inputs[0].trimmingCharacters(in: .whitespacesAndNewlines)) else {
    fatalError("Unable to fetch number of items from test input");
}

guard let num_of_rotations = Int(str_inputs[1].trimmingCharacters(in: .whitespacesAndNewlines)) else{
    fatalError("Unable to fetch number of rotations");
}

guard let testInput_data = readLine() else{
    fatalError("Unable to fetch test input data");
}

let testInput: [Int] = testInput_data.split(separator: " ").map({
    return Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0;
});


//------ Error checking -----
if testInput.count <= 0 {
// no input supplied.
    fatalError("No input supplied");
}else if (num_of_items != testInput.count) {
    fatalError("Item count mismatch");
}



//------ Data Logging -----
func printDescription() {
    print("{Input: \(testInput)}, {Rotations: \(num_of_rotations)}, {Num of Items: \(num_of_items)}");
    print("Output  : \(testOutput)");
}


//------ Logical Core -----
var testOutput: Array<Int> = Array<Int>(repeating: 0, count: testInput.count);
var rotations: Int = num_of_rotations % testInput.count;

func rotateLeft() {
    
    var sourceIndex: Int = 0;
    var destinationIndex: Int = testInput.count - rotations;
    
    for _ in 0..<testInput.count {
        testOutput[destinationIndex] = testInput[sourceIndex];
        
        destinationIndex -= 1;
        sourceIndex -= 1;
        
        if (destinationIndex < 0){
            destinationIndex = testInput.count - 1;
        }
        if (sourceIndex < 0){
            sourceIndex = testInput.count - 1;
        }
    }
    
}


//------ Run-loop -----
rotateLeft();
//printDescription();

print("\(testOutput.map({String($0)}).joined(separator: " "))")
