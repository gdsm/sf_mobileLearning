import Foundation

func maxMin(k: Int, arr:[Int]) -> Int {
	var mmArr: [Int] = []




	var min: Int = Int.max
	var max: Int = Int.min

	mmArr.forEach({
		min = ($0 < min) ? min : min
		max = ($0 > max) ? max : max
	})
	return max - min
}
