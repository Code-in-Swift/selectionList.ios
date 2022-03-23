import UIKit

class StandingsViewController: ViewController<UIView> {
    var selectedSeason: Season? {
        didSet {
            var title: String {
                guard let selectedSeason = selectedSeason else {
                    return "Select Season"
                }

                return String(selectedSeason)
            }
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: title,
                style: .done,
                target: self,
                action: #selector(changeSeason)
            )
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Standings"
        ui.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSeason = .current
    }
    
    @objc
    private func changeSeason(_ sender: UIBarButtonItem) {
        let selectionList = SelectionList<Season>(
            title: "Season",
            values: .all,
            selectedValue: selectedSeason
        )
        
        let handler: SelectionListViewController<Season>.Handler = { season, viewController in
            self.selectedSeason = season
            viewController.dismiss(animated: true)
        }
        
        let vc = SelectionListViewController(
            selectionList: selectionList,
            handler: handler
        )
        
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }
}
