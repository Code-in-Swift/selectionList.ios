import UIKit

class SelectableListCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .darkText
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon.checkmark")
        imageView.contentMode = .center
        imageView.tintColor = .systemBlue
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            label,
            imageView
        ])
        
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.axis = .horizontal
        stackView.spacing = 12
        
        return stackView
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        
        addSubview(separator)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(text: String, isSelected: Bool) {
        label.text = text
        label.font = isSelected
        ? .systemFont(ofSize: 17, weight: .medium)
        : .systemFont(ofSize: 17, weight: .regular)
        
        imageView.isHidden = !isSelected
    }
}
