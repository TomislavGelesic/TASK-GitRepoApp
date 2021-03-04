import UIKit

protocol CoordinatorDelegate: class {
    func viewControllerHasFinished(goTo option: SceneOption)
}
