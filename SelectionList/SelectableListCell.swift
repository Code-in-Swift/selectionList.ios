import UIKit

class SelectableListCell: UICollectionViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .darkText
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.contentMode = .center
        imageView.tintColor = .systemBlue
            
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            iconImageView,
            label
        ])
        
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        preservesSuperviewLayoutMargins = true
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(checkmarkImageView)
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        checkmarkImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        checkmarkImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        checkmarkImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: checkmarkImageView.leadingAnchor, constant: -10).isActive = true
        
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
    
    func render(icon: UIImage?, text: String, isSelected: Bool) {
        if let icon = icon {
            iconImageView.image = icon
            iconImageView.isHidden = false
        }
        else {
            iconImageView.isHidden = true
        }
        
        label.text = text
        checkmarkImageView.isHidden = !isSelected
    }
}
