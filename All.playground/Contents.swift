import UIKit


struct Add {
    var a: Int
    var b: Int
}

let sum = Add(a: 2, b: 3)

let closure = {
    print("sum... \(sum)")
}

closure()



