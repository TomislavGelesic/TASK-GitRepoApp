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
    
    func start() {
        goToDetailScreen(DetailsDomainItem(title: "testing", webPagePath: URLRequest(url: URL(string: "https://www.apple.com")!)))
    }
//    func start() { goToSearchScene() }
    
    
    func childDidFinish(_ coordinator: Coordinator, next: SceneOption) {
        switch next {
        case .detailScene(let info):
            childCoordinators = childCoordinators.filter({ (coord) -> Bool in
                if let _ = coordinator as? SearchSceneCoordinator, coordinator === coord { return true }
                else { return false }
            })
            goToDetailScreen(info)
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
    
    func goToDetailScreen(_ info: DetailsDomainItem) {
        let child = DetailsScreenCoordinator(navigationController: navigationController)
        child.delegate = self
        childCoordinators.append(child)
        child.start(with: info)
    }
    
    func goToBrowserScene() {
        
    }
}

