import Foundation

final public class Human: NSObject {
    public let name: String
    public let language: String
    public let isMarried: Bool
    public let limps: Int
    
    public init(name: String, language: String, isMarried: Bool, limps: Int) {
        self.name = name
        self.language = language
        self.isMarried = isMarried
        self.limps = limps
    }
}

extension Human: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case language = "language"
        case isMarried = "isMarried"
        case limps = "limps"
    }
}

// CustomStringConvertable
extension Human {
    override public var description: String {
        return "name: \(self.name), language: \(self.language), isMarried: \(self.isMarried), limp: \(self.limps)"
    }
}


// Let's make a human the normal way
// let man01 = Human(name: "jin", language: "chinese", isMarried: false, limps: 4)
// Let's mock a json
let json = """
[
    {
        "name": "jin",
        "language": "chinese",
        "isMarried": false,
        "limps": 4
    }
]
""".data(using: .utf8)!

// Let's make a human with Codable
let array = try! JSONDecoder().decode([Human].self, from: json)
for element in array {
    print(element)
}

print(array.count)
