//
//  ResultSceneCoordinator.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit

class ResultSceneCoordinator: Coordinator, CoordinatorDelegate {
    
    var delegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() { }
    
    func start(_ option: ResultSceneOption) {
        
        var viewController: UIViewController?
        switch option {
        case .repositories(search: let searchText):
            let viewModel = RepositoriesResultViewModel()
            viewController = RepositoriesResultsViewController(viewModel: viewModel)
        case .users(search: let searchText):
            let viewModel = UsersResultViewModel()
            viewController = UsersResultsViewController(viewModel: viewModel)
        case .usersAndRepositories(search: let searchText):
            break
        }
        guard let vc = viewController else { return }
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewControllerHasFinished(goTo option: SceneOption) {
        
    }
    

}
