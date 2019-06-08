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


// diff between == and ===
class Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    init(name: String) {
        self.name = name
    }
}

let p1:Person = Person(name: "Red")
let p2:Person = Person(name: "Red")

let p3 = p1
if p1 == p2 {
    print("Equal")
}

if p1 === p3  {
    print("Identical")
} else {
    print("not identical")
}


// Observable wrapper for properties

class Observable<T> {
    var value: T {
        didSet {
            guard let completion = completion else {
                return
            }
            completion(value)
        }
    }
    private var completion: ((T) -> ())? = nil
    
    init(value: T) {
        self.value = value
    }

    func observe(completion: @escaping (T) -> ()) {
        self.completion = completion
    }
}

var obsv = Observable<String>(value: "Reddy")


obsv.observe { newValue in
    print("new value being observed is \(newValue)")
}

obsv.value = "kanth"
obsv.value = "ham"
obsv.value = "sdfd"




