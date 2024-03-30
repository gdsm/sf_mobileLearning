import Foundation

func checkMagazine(magazine: [String], note: [String]) -> Void {
	var magazineHash: [String: Int] = [:]
    var retVal = "Yes"
    magazine.forEach({
        magazineHash[$0] = (magazineHash[$0] ?? 0) + 1
    })
    note.forEach({
        let value = (magazineHash[$0] ?? 0) - 1
        if value < 0 {
            retVal = "No"
        }
        magazineHash[$0] = value
    })
    print(retVal)
}

checkMagazine(magazine: ["two", "times", "three", "is", "not", "four"], note: ["two", "times", "two", "is", "four"])
