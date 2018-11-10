import Foundation

final public class Human: NSObject {
    public var name: String
    public var language: String
    public var isMarried: Bool
    public var limps: Int
    public var pets: [Pet] = []
    
    public init(name: String, language: String, isMarried: Bool, limps: Int) {
        self.name = name
        self.language = language
        self.isMarried = isMarried
        self.limps = limps
    }
}

extension Human: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case language
        case isMarried
        case limps
        case pets
    }
}

// CustomStringConvertable
extension Human {
    override public var description: String {
        return "name: \(self.name), language: \(self.language), isMarried: \(self.isMarried), limp: \(self.limps), pets: \(self.pets)"
    }
}

//////////////////////////////////////////////////////////////////////////

final public class Pet: NSObject {
    public weak var owner: Human?
    public var name: String
    public let species: String
    public var age: Int
    
    init(name: String, species: String, age: Int) {
        self.name = name
        self.species = species
        self.age = age
        self.owner = nil
    }
}

extension Pet: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case species
        case age
    }
}

// CustomStringConvertable
extension Pet {
    public override var description: String {
        return "owner: \(String(describing: self.owner?.name)), name: \(self.name), species: \(self.species), age: \(self.age)"
    }
}

//////////////////////////////////////////////////////////////////////////


// Let's make a human and a pet the normal way
//let man01 = Human(name: "jin", language: "chinese", isMarried: false, limps: 4)
//let pet01 = Pet(name: "sponge", species: "cat", age: 1)
//man01.pets.append(pet01)
//print(man01)

// Let's mock a json
let json = """
[
    {
        "name": "jin",
        "language": "chinese",
        "isMarried": false,
        "limps": 4,
        "pets": [
            {
                "name": "sponge",
                "species": "cat",
                "age": 1
            }
        ]
    }
]
""".data(using: .utf8)!

// Let's make a human and pet with Codable
let array = try! JSONDecoder().decode([Human].self, from: json)
for element in array {
    print(element)
}
