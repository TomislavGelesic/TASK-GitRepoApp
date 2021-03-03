
import UIKit

class DetailsScreenCoordinator: Coordinator, CoordinatorDelegate {
    
    var delegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("DetailsScreenCoordinator deinit called.") }
    
    func start() { }
    
    func start(with info: DetailsDomainItem) {
        let vm = DetailsScreenViewModel(info)
        vm.coordinatorDelegate = self
        navigationController.pushViewController(DetailsScreenViewController(viewModel: vm), animated: true)
    }
    
    func viewControllerHasFinished(goTo option: SceneOption) {
        navigationController.popViewController(animated: true)    
        delegate?.childDidFinish(self, next: option)
    }
    

}
