import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let vc = StandingsViewController()
        let nc = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}
