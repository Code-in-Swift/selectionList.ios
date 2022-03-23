import UIKit

class ViewController<UI: UIView>: UIViewController {
    let ui = UI(frame: UIScreen.main.bounds)
    
    override func loadView() {
        self.view = ui
    }
}
