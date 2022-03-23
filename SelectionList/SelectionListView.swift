import UIKit

class SelectionListView: UIView {
    let collectionView: UICollectionView
    
    override init(frame: CGRect) {
        collectionView = UICollectionView(
            frame: frame,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
