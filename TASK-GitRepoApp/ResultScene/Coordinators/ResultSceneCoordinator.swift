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
    
    deinit { print("ResultSceneCoordinator deinit called") }
    
    func start() { }
    
    func start(_ option: ResultSceneOption) {
        
        var nextController: UIViewController?
        switch option {
        case .repositories(search: let query):
            let vm = RepositoriesResultViewModel(query: query, repository: RepositoriesResultRepositoryImpl())
            vm.coordinatorDelegate = self
            let vc = RepositoriesResultsViewController(viewModel: vm)
            nextController = vc
        case .users(search: let query):
            let vm = UsersResultViewModel(query: query, repository: UserResultRepositoryImpl())
            vm.coordinatorDelegate = self
            let vc = UsersResultsViewController(viewModel: vm)
            nextController = vc
        case .usersAndRepositories(search: let query):
            let userVM = UsersResultViewModel(query: query, repository: UserResultRepositoryImpl())
            userVM.coordinatorDelegate = self
            let userVC = UsersResultsViewController(viewModel: userVM)
            let repoVM = RepositoriesResultViewModel(query: query, repository: RepositoriesResultRepositoryImpl())
            repoVM.coordinatorDelegate = self
            let repoVC = RepositoriesResultsViewController(viewModel: repoVM)
            nextController = TabmanAdapter(viewControllers: [repoVC, userVC])
        }
        guard let controllerOK = nextController else { return }
        navigationController.pushViewController(controllerOK, animated: true)
    }
    
    func viewControllerHasFinished(goTo option: SceneOption) {
        navigationController.popViewController(animated: false)
        delegate?.childDidFinish(self, next: option)
    }
    

}
