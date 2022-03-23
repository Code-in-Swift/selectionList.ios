import Foundation

struct SelectionList<SelectableValue: Selectable> {
    let title: String
    let values: [SelectableValue]
    let selectedValue: SelectableValue?
}
