import UIKit

struct Person {
    let name = "Rajesh"
}

let man = Person()
print(man.name)

@dynamicMemberLookup
struct DynamicPerson {
    subscript(dynamicMember member: String) -> String {
        let person = [
            "name": "Rajesh",
            "platform": "iOS",
            "country": "India"
        ]
        return person[member, default: ""]
    }
}

let person = DynamicPerson()
print(person.name)
print(person.platform)
print(person.country)


@dynamicMemberLookup
protocol Lookupable {
    subscript(dynamicMember member: String) -> String { get }
}

class Bar: Lookupable {
    private let json = [
        "setting1": "1",
        "setting2": "2",
        "setting3": "3",
        "setting4": "4",
        "setting5": "5"
    ]
    init() {}
    
    subscript(dynamicMember member: String) -> String {
        return json[member, default: "0"]
    }
}

let bar = Bar()
print(bar.setting1)
print(bar.setting9)
