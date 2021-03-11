//
//  SearchSceneCoordinator.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit

class SearchSceneCoordinator: Coordinator, CoordinatorDelegate {
    
    weak var coordinatorDelegate: AppCoordinator?
    var childCoordinators: [Coordinator] = .init()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    deinit { print("SearchSceneCoordinator deinit called.") }
    
    func start() {
        let viewModel = SearchViewModel()
        viewModel.coordinator = self
        let viewController = SearchViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToSearchScene() { }
    func goToResultScene(_ option: ResultSceneOption) { coordinatorDelegate?.goToResultScene(option) }
    func goToDetailScreen(_ info: DetailsDomainItem) { }
}

