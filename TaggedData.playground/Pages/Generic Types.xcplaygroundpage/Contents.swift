import Foundation

struct Wrapper<T: Equatable> {
    var storage: T
    
    init(_ value: T) {
        storage = value
    }
}

let piWrapped = Wrapper(Double.pi)// Wrapper<Double>(Double.pi)

let stringWrapped = Wrapper("POP")

let dateWrapped = Wrapper(Date())
