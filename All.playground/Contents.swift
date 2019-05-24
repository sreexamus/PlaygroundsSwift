import UIKit

struct Add {
    var a: Int
    var b: Int

    var sum: Int {
        return a + b
    }
}

var sum = Add(a: 2, b: 3)


// clousre capture creates a new copy of the object for values types like structs
let closure = { [sum] in 
    print("sum... \(sum.sum)")
}

sum.a = 10

closure()


class A {
  var myClosure: (() -> ())?
  var contantValue = 23
  
  func message() {
    myClosure = { 
    self.contantValue = 45
    }
  }  
}
let a = A()
a.message()
// A has strong reference to myClosure. myClosure has strong refernce to A(self strongly captured)



