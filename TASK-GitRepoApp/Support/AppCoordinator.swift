
import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow?
    var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    
    init() {
        window = UIWindow()
        window?.backgroundColor = .white
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        self.navigationController = navigationController

    }
    
    deinit { print("AppCoordinator deinit called.") }
    
    func start() { goToSearchScene() }
    
    func childDidFinish(_ coordinator: CoordinatorDelegate?) {
        for (index, item) in childCoordinators.enumerated() {
            if item === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func goToSearchScene(){
        let child = SearchSceneCoordinator(navigationController: navigationController)
        child.coordinatorDelegate = self
        child.start()
    }
    
    func goToResultScene(_ option: ResultSceneOption) {
        let child = ResultSceneCoordinator(navigationController: navigationController)
        child.coordinatorDelegate = self
        childCoordinators.append(child)
        child.start(option)
    }
    
    func goToDetailScreen(_ info: DetailsDomainItem) {
        let child = DetailsSceneCoordinator(navigationController: navigationController)
        child.coordinatorDelegate = self
        childCoordinators.append(child)
        child.start(with: info)
    }
}

