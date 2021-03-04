import Foundation
import Combine


class SearchViewModel {
    
    var coordinatorDelegate: CoordinatorDelegate?
    var selectedOptions: [FilterOption] = [.repositories]
    var updateFilterLabelSubject = CurrentValueSubject<Int, Never>(1)
    
    deinit {
        print("SearchViewModel deinit called.")
    }
    
    func searchButtonTapped(for searchQuery: String) {
        if selectedOptions.contains(.repositories), selectedOptions.contains(.users) {
            coordinatorDelegate?.viewControllerHasFinished(goTo: .resultScene(option: .usersAndRepositories(search: searchQuery)))
        }
        else if selectedOptions.contains(.repositories) {
            coordinatorDelegate?.viewControllerHasFinished(goTo: .resultScene(option: .repositories(search: searchQuery)))
        }
        else {
            coordinatorDelegate?.viewControllerHasFinished(goTo: .resultScene(option: .users(search: searchQuery)))
        }
    }
    
    func filterButtonTapped(on vc: SearchViewController?) {
        guard let parentVC = vc else { return }
        let viewModel = FilterViewModel(initFilterOptions: selectedOptions)
        viewModel.filterOptions = selectedOptions
        viewModel.delegate = self
        let viewController = FilterViewController(viewModel: viewModel)
        viewController.backgroundImage.image = parentVC.navigationController?.view.asImage()
        viewController.modalPresentationStyle = .fullScreen
        parentVC.present(viewController, animated: false)        
    }
}

extension SearchViewModel: FilterViewModelDelegate {
    func updateFilterSelection(_ selectedOptions: [FilterOption]) {
        self.selectedOptions = selectedOptions
        updateFilterLabelSubject.send(selectedOptions.count)
    }
}
