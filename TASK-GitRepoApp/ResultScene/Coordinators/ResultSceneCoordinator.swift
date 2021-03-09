
import UIKit

class ResultSceneCoordinator: Coordinator, CoordinatorDelegate {
    
    var delegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit { print("ResultSceneCoordinator deinit called") }
    
    func start() { }
    
    func start(_ option: ResultSceneOption) {
        
        var nextController: UIViewController?
        switch option {
        case .repositories(search: let query):
            let vm = RepositoriesResultViewModel(query: query, repository: RepositoriesResultRepositoryImpl())
            vm.coordinatorDelegate = self
            let vc = RepositoriesResultsViewController(viewModel: vm)
            nextController = ResultSceneViewControllerWrapper(rootViewController: vc)
        case .users(search: let query):
            let vm = UsersResultViewModel(query: query, repository: UserResultRepositoryImpl())
            vm.coordinatorDelegate = self
            let vc = UsersResultsViewController(viewModel: vm)
            nextController = ResultSceneViewControllerWrapper(rootViewController: vc)
        case .usersAndRepositories(search: let query):
            let userVM = UsersResultViewModel(query: query, repository: UserResultRepositoryImpl())
            userVM.coordinatorDelegate = self
            let userVC = UsersResultsViewController(viewModel: userVM)
            let repoVM = RepositoriesResultViewModel(query: query, repository: RepositoriesResultRepositoryImpl())
            repoVM.coordinatorDelegate = self
            let repoVC = RepositoriesResultsViewController(viewModel: repoVM)
            let vc = TabmanResultsViewController(viewControllers: [repoVC, userVC])
            nextController = ResultSceneViewControllerWrapper(rootViewController: vc)
        }
        guard let controllerOK = nextController else { return }
        navigationController.pushViewController(controllerOK, animated: true)
    }
    
    func viewControllerHasFinished(goTo option: SceneOption) {
        delegate?.childDidFinish(self, next: option)
    }
    
    func viewControllerHasFinished() {
//        delegate?.childDidFinish(self, next: nil)
    }
    

}
