import Foundation


class SearchViewModel {
    
    
    func searchButtonTapped() {
        
    }
    
    func filterButtonTapped(on vc: SearchViewController?) {
        guard let parentVC = vc else { return }
        let viewController = FilterViewController(viewModel: FilterViewModel())
        viewController.backgroundImage.image = parentVC.navigationController?.view.asImage()
        viewController.modalPresentationStyle = .fullScreen
        parentVC.present(viewController, animated: false)        
    }
}
