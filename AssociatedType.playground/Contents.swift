import UIKit

protocol Appendable {
    associatedtype Item
    
    var collection: [Item] { get set }
    
    func append(_ item: Item)
}

class StringArray: Appendable {
    typealias Item = String
    
    var collection: [String] = []
    
    func append(_ item: String) {
        collection.append(item)
    }
}

class NumberArray: Appendable {
    typealias Item = Int

    var collection: [Int] = []
    
    func append(_ item: Int) {
        collection.append(item)
    }
    
}
