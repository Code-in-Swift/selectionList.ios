import UIKit

protocol Selectable: Equatable {
    var title: String { get }
    var icon: UIImage? { get }
}
