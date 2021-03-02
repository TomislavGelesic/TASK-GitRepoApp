import Foundation
import Combine


class SearchViewModel {
    
    weak var coordinatorDelegate: CoordinatorDelegate?
    var selectedOptions: [FilterOption] = [.repositories]
    var updateFilterLabelSubject = CurrentValueSubject<Int, Never>(1)
    
    func searchButtonTapped(for searchText: String) {
        let endpoint = Endpoint.searchRepositories(matching: searchText)
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
