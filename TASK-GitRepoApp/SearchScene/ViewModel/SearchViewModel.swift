import Foundation
import Combine


class SearchViewModel {
    
    weak var viewControllerDelegate: SearchViewController?
    var coordinator: CoordinatorDelegate?
    var selectedOptions: [FilterOption] = [.repositories]
    var updateFilterLabelSubject = CurrentValueSubject<Int, Never>(1)
    
    deinit {
        print("SearchViewModel deinit called.")
    }
    
    func searchTextChanged(_ text: String?) {
        if let validText = text,
           validText.count >= 2 { viewControllerDelegate?.enableSearch(true) }
        else { viewControllerDelegate?.enableSearch(false) }
    }
    
    func searchButtonTapped(for text: String?) {
        if let query = text {
            if selectedOptions.contains(.repositories), selectedOptions.contains(.users) {
                coordinator?.goToResultScene(.usersAndRepositories(search: query))
            }
            else if selectedOptions.contains(.repositories) {
                coordinator?.goToResultScene(.repositories(search: query))
            }
            else {
                coordinator?.goToResultScene(.users(search: query))
            }
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
