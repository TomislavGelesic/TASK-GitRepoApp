
import UIKit

class DetailsSceneCoordinator: NSObject, Coordinator, CoordinatorDelegate {
    
    weak var coordinatorDelegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("DetailsScreenCoordinator deinit called.") }
    
    func start() { }
    
    func start(with info: DetailsDomainItem) {
        navigationController.delegate = self
        let vm = DetailsSceneViewModel(info)
        vm.coordinatorDelegate = self
        navigationController.pushViewController(DetailsSceneViewController(viewModel: vm), animated: true)
    }
    func goToSearchScene() { }
    func goToResultScene(_ option: ResultSceneOption) { }
    func goToDetailScreen(_ info: DetailsDomainItem) { }
}

extension DetailsSceneCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        // Check whether our view controller array already contains that view controller. If it does, it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromVC) { return }
        // We’re still here – it means we’re popping the view controller, so we can check which controller
        if let detailVC = fromVC as? DetailsSceneViewController {
            // We're popping a buy view controller; end its coordinator
            coordinatorDelegate?.childDidFinish(detailVC.viewModel.coordinatorDelegate)
        }
    }    
}
