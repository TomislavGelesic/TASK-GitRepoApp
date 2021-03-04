
import UIKit
import Combine

class DetailsScreenViewModel {

    var coordinatorDelegate: CoordinatorDelegate?
    var screenData: DetailsDomainItem
    
    init(_ item: DetailsDomainItem) {
        self.screenData = item
    }
    
    deinit { print("DetailsScreenViewModel deinit called.") }

    func backButtonTapped() {
        coordinatorDelegate?.viewControllerHasFinished(goTo: .searchScene)
    }
}
