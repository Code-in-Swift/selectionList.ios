import UIKit

typealias Season = Int

extension Season: Selectable {    
    var title: String {
        return String(self)
    }
    
    var icon: UIImage? {
        return nil
    }
}

extension Season {
    static var current: Season {
        let calendar = Calendar.current
        let date = Date()
        
        let dateComponents = calendar.dateComponents([.year], from: date)
        return dateComponents.year!
    }
}

extension Array where Element == Season {
    static var all: [Season] {
        let current: Season = .current
        return Array(1950...current).reversed()
    }
}
