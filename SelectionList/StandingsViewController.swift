import UIKit

class StandingsViewController: ViewController<UIView> {
    var selectedChampionship: Championship = .drivers {
        didSet {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: selectedChampionship.title,
                style: .done,
                target: self,
                action: #selector(changeChampionship)
            )
        }
    }
    
    var selectedSeason: Season = .current {
        didSet {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: selectedSeason.title,
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
        selectedChampionship = .drivers
        selectedSeason = .current
    }
    
    @objc
    private func changeChampionship(_ sender: UIBarButtonItem) {
        let selectionList = SelectionList<Championship>(
            title: "Championship",
            values: [ .drivers, .constructors ],
            selectedValue: selectedChampionship
        )
        
        let handler: SelectionListViewController<Championship>.Handler = { championship, viewController in
            self.selectedChampionship = championship
            viewController.dismiss(animated: true)
        }
        
        let vc = SelectionListViewController(
            selectionList: selectionList,
            handler: handler
        )
        
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
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
