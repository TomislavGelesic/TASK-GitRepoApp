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
        case .repositories(search: let searchText):
            let vm = RepositoriesResultViewModel()
            vm.coordinatorDelegate = self
            let vc = RepositoriesResultsViewController(viewModel: vm)
            nextController = vc
        case .users(search: let searchText):
            let vm = UsersResultViewModel()
            vm.coordinatorDelegate = self
            let vc = UsersResultsViewController(viewModel: vm)
            nextController = vc
        case .usersAndRepositories(search: let searchText):
            let userVM = UsersResultViewModel()
            userVM.coordinatorDelegate = self
            let userVC = UsersResultsViewController(viewModel: userVM)
            let repoVM = RepositoriesResultViewModel()
            repoVM.coordinatorDelegate = self
            let repoVC = RepositoriesResultsViewController(viewModel: repoVM)
            nextController = TabmanAdapter(viewControllers: [repoVC, userVC])
        }
        guard let controllersOK = nextController else { return }
        navigationController.pushViewController(controllersOK, animated: true)
    }
    
    func viewControllerHasFinished(goTo option: SceneOption) {
        navigationController.popViewController(animated: true)        
        delegate?.childDidFinish(self, next: option)
    }
    

}
