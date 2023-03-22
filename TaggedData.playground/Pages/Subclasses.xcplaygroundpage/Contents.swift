import Foundation

class TaggedData {
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.data = data
        self.tag = tag
    }
}

class PersistentTaggedData: TaggedData {
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    convenience init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
}

class TaggedDataWithEncoding: TaggedData {
    var Base64EncodedString: String {
        return data.base64EncodedString()
    }
}
/*
class PersistedBase64Encoded: PersistentTaggedData, TaggedDataWithEncoding {
    
}
*/

