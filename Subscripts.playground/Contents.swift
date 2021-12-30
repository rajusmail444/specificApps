import UIKit

let array = [1, 2, 3, 4]
print(array[1])

let dict = ["word": 1, "thing": 2]
print(dict["word"])

struct TimesTable {
    let multipler: Int
    
    subscript(number: Int) -> Int {
        return number * multipler
    }
    
    func with(_ number: Int) -> Int {
        return number * multipler
    }
}

let sevenTimesTable = TimesTable(multipler: 7)
//How can you access sevenTimesTable[1] instead as below
print(sevenTimesTable.with(5))
print(sevenTimesTable[5])
