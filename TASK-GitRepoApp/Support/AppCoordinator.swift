import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow?
    var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        navigationController.pushViewController(SearchViewController(viewModel: SearchViewModel()), animated: true)
    }
    
    init() {
        window = UIWindow()
        window?.backgroundColor = .white
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        self.navigationController = navigationController
    }
    
    deinit {
        print("AppCoordinator deinit called.")
    }
}

extension AppCoordinator {
    
    func childDidFinish(_ coordinator: Coordinator, goTo nextScene: SceneOption) {
        childCoordinators = childCoordinators.filter({ (coord) -> Bool in
            if let _ = coordinator as? SearchSceneCoordinator { return false }
            else { return true }
        })
        switch nextScene {
        case .detail: break
        case .result: break
        case .search: break
        }
    }

    func goToSearchScene(){
        let child = SearchSceneCoordinator(navigationController: navigationController)
        child.delegate = self
        child.start()
    }

    func goToResultScene() {
        let child = ResultSceneCoordinator(navigationController: navigationController)
        child.delegate = self
        childCoordinators.append(child)
        child.start()
    }
}

