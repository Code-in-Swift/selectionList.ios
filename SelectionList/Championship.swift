import UIKit

enum Championship: Selectable {
    case drivers
    case constructors
    
    var title: String {
        switch self {
        case .drivers:
            return "Drivers"
        case .constructors:
            return "Constructors"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .drivers:
            return UIImage(systemName: "person")
        case .constructors:
            return UIImage(systemName: "gear")
        }
    }
}
