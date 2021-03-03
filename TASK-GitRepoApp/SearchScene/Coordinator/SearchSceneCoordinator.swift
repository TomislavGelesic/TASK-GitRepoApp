//
//  SearchSceneCoordinator.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit

class SearchSceneCoordinator: Coordinator, CoordinatorDelegate {
    
    var delegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("SearchSceneCoordinator deinit called.")
    }
    
    func start() {
        let viewModel = SearchViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = SearchViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func viewControllerHasFinished(goTo option: SceneOption) {
        delegate?.childDidFinish(self, next: option)
    }
    

}
