import UIKit

func add<T: Numeric>(_ n1: T, _ n2: T) -> T {
    return n1 + n2
}

print(add(1,2))
