import Foundation
import UIKit

//MARK: View controller
extension UIViewController {
    func addChildController(_ child: UIViewController, frame: CGRect? = nil) {
        addChildViewController(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    func removeChildController() {
        willMove(toParentViewController: nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}