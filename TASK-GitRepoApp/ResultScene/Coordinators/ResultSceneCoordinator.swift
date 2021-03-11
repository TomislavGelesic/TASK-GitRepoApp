
import UIKit

class ResultSceneCoordinator: NSObject, Coordinator, CoordinatorDelegate {
    
    weak var coordinatorDelegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("ResultSceneCoordinator deinit called") }
    
    func start() { }
    
    func start(_ option: ResultSceneOption) {
        navigationController.delegate = self
        var nextController: UIViewController?
        switch option {
        case .repositories(search: let query):
            let vm = RepositoriesResultViewModel(query: query, repository: RepositoriesResultRepositoryImpl())
            vm.coordinator = self
            let vc = RepositoriesResultsViewController(viewModel: vm)
            nextController = ResultSceneViewControllerWrapper(vc)
        case .users(search: let query):
            let vm = UsersResultViewModel(query: query, repository: UserResultRepositoryImpl())
            vm.coordinator = self
            let vc = UsersResultsViewController(viewModel: vm)
            nextController = ResultSceneViewControllerWrapper(vc)
        case .usersAndRepositories(search: let query):
            let userVM = UsersResultViewModel(query: query, repository: UserResultRepositoryImpl())
            userVM.coordinator = self
            let userVC = UsersResultsViewController(viewModel: userVM)
            let repoVM = RepositoriesResultViewModel(query: query, repository: RepositoriesResultRepositoryImpl())
            repoVM.coordinator = self
            let repoVC = RepositoriesResultsViewController(viewModel: repoVM)
            let vc = TabmanResultsViewController(viewControllers: [repoVC, userVC])
            nextController = ResultSceneViewControllerWrapper(vc)
        }
        guard let controllerOK = nextController else { return }
        navigationController.pushViewController(controllerOK, animated: true)
    }
    
    func goToSearchScene() {  }
    func goToResultScene(_ option: ResultSceneOption) { }
    func goToDetailScreen(_ info: DetailsDomainItem) { coordinatorDelegate?.goToDetailScreen(info) }
}

extension ResultSceneCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        // Check whether our view controller array already contains that view controller. If it does, it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromVC) { return }
        // We’re still here – it means we’re popping the view controller, so we can check which controller and call coordinator deinit
        if let resultVC = fromVC as? ResultSceneViewControllerWrapper,
           let rootVC = resultVC.rootViewController as? RepositoriesResultsViewController,
           let coordinator = rootVC.viewModel.coordinator {
            coordinatorDelegate?.childDidFinish(coordinator)
            return
        }
        if let resultVC = fromVC as? ResultSceneViewControllerWrapper,
           let rootVC = resultVC.rootViewController as? UsersResultsViewController,
           let coordinator = rootVC.viewModel.coordinator {
            coordinatorDelegate?.childDidFinish(coordinator)
            return
        }
        if let resultVC = fromVC as? ResultSceneViewControllerWrapper,
           let rootVC = resultVC.rootViewController as? TabmanResultsViewController,
           let vc = rootVC.viewControllers.first as? RepositoriesResultsViewController,
           let coordinator = vc.viewModel.coordinator {
            coordinatorDelegate?.childDidFinish(coordinator)
            return
        }
    }
}
