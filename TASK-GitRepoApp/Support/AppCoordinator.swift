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
    
    func childDidFinish(_ coordinator: Coordinator, next: SceneOption) {
        switch next {
        case .detailScene:
            childCoordinators = childCoordinators.filter({ (coord) -> Bool in
                if let _ = coordinator as? SearchSceneCoordinator, coordinator === coord { return true }
                if let _ = coordinator as? ResultSceneCoordinator, coordinator === coord { return true }
                else { return false }
            })
            goToDetailScreen()
        case .resultScene(let option):
                childCoordinators = childCoordinators.filter({ (coord) -> Bool in
                    if let _ = coordinator as? SearchSceneCoordinator, coordinator === coord { return true }
                    else { return false }
                })
            goToResultScene(option)
        case .searchScene:
            childCoordinators = childCoordinators.filter({ (coord) -> Bool in
                if let _ = coordinator as? SearchSceneCoordinator, coordinator === coord  { return true }
                else { return false }
            })
        case .browserScene:
            childCoordinators = childCoordinators.filter({ (coord) -> Bool in
                if let _ = coordinator as? SearchSceneCoordinator, coordinator === coord { return true }
                if let _ = coordinator as? ResultSceneCoordinator, coordinator === coord { return true }
                else { return false }
            })
            goToBrowserScene()
        }
    }

    func goToSearchScene(){
        let child = SearchSceneCoordinator(navigationController: navigationController)
        child.delegate = self
        child.start()
    }

    func goToResultScene(_ option: ResultSceneOption) {
        let child = ResultSceneCoordinator(navigationController: navigationController)
        child.delegate = self
        childCoordinators.append(child)
        child.start(option)
    }
    
    func goToDetailScreen() {
        
    }
    
    func goToBrowserScene() {
        
    }
}

