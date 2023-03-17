import Foundation

protocol Taggable {
    var tag: String { get }
    var data: Data { get }
    init(tag: String, data: Data)
}

protocol TaggedPersistable: Taggable, CustomStringConvertible, Equatable {
    init(tag: String, contentOf url: URL) throws
    func persist(to url: URL) throws
}

extension TaggedPersistable{
    init(tag: String, contentOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

protocol TaggedEncodable: Taggable {
    var base64: String { get }
}

extension TaggedEncodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}

struct MyData: TaggedPersistable, TaggedEncodable {
    
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

extension MyData: CustomStringConvertible {
    var description: String {
        return "MyData(\(tag)"
    }
}


struct PersistableData: TaggedPersistable {
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    
    var tag: String
    
    var data: Data
    
    var description: String {
        return "PersistableData(\(tag)"
    }
    
    
}

let p = PersistableData(tag: "42", data: Data(repeating: 1, count: 10))

