import UIKit

class Pokemon: NSObject {
    @objc dynamic var name: String
    
    init(name: String) {
       self.name = name
    }
}

let myFirstPokemon = Pokemon(name: "Charmander")

//let pokemonName = myFirstPokemon.value(forKey: "name")
//myFirstPokemon.setValue("Charmeleon", forKey: "name")

myFirstPokemon.observe(\.name, options: [.old, .new]) { (pokemon, value) in
    print("old name \(value.oldValue)")
    print("old name \(value.newValue)")
}

myFirstPokemon.name = "Charmeleon"
