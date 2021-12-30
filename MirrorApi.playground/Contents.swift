import UIKit

extension Mirror {
    static func match<T>(
        for thing: Any,
        matching: T.Type = T.self,
        block: @escaping (T) -> Void
    ) {
        let reflection = Mirror(reflecting: thing)
        for child in reflection.children {
            if let match = child.value as? T {
                block(match)
            }
        }
    }
}

struct Measurements {
    let height: Float
    let width: Float
    let weight: Int
    let depth: Int
}

func go() {
    print("Started")
    let measurements = Measurements(
        height: 12.2,
        width: 32.1,
        weight: 101,
        depth: 7
    )
    Mirror.match(for: measurements, matching: Int.self) { match in
        print("Found: \(match)\n")
    }
}
go()
