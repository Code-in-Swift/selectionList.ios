import UIKit

class SelectionListViewController<SelectableValue: Selectable>: ViewController<SelectionListView>, UICollectionViewDataSource, UICollectionViewDelegate {
    typealias Handler = ((SelectableValue, UIViewController) -> Void)

    private let values: [SelectableValue]
    private let selectedValue: SelectableValue?
    private let handler: Handler

    private var compositionalLayout: UICollectionViewLayout {
        return UICollectionViewCompositionalLayout(
            sectionProvider: section(section:environment:),
            configuration: UICollectionViewCompositionalLayoutConfiguration()
        )
    }
    
    init(selectionList: SelectionList<SelectableValue>, handler: @escaping Handler) {
        self.values = selectionList.values
        self.selectedValue = selectionList.selectedValue
        self.handler = handler
                
        super.init(nibName: nil, bundle: nil)
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = selectionList.title
        
        ui.collectionView.register(
            SelectableListCell.self,
            forCellWithReuseIdentifier: "SelectableListCell"
        )
        
        ui.collectionView.dataSource = self
        ui.collectionView.delegate = self
        ui.collectionView.collectionViewLayout = compositionalLayout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectedValue = selectedValue {
            DispatchQueue.main.async {
                self.scroll(to: selectedValue)
            }
        }
    }
        
    private func scroll(to value: SelectableValue) {
        guard let index = values.firstIndex(of: value) else {
            return
        }
        
        let indexPath = IndexPath(
            item: max(0, index - 1),
            section: 0
        )

        ui.collectionView.scrollToItem(
            at: indexPath,
            at: .top,
            animated: false
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UICollectionViewDataSource.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableListCell", for: indexPath) as! SelectableListCell
        let value = values[indexPath.item]
        let isSelected = (value == selectedValue)
        cell.render(text: value.title, isSelected: isSelected)
        return cell
    }
    
    // MARK: - UICollectionViewCompositionalLayout.
    
    private func section(section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let collectionLayoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
                
        let collectionLayoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: collectionLayoutSize,
            subitems: [
                NSCollectionLayoutItem(layoutSize: collectionLayoutSize)
            ]
        )
                
        return NSCollectionLayoutSection(group: collectionLayoutGroup)
    }

    // MARK: - UICollectionViewDelegate.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedValue = values[indexPath.item]
        handler(selectedValue, self)
    }
    
}
