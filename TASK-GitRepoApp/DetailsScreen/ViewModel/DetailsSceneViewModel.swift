
import UIKit

class DetailsSceneViewModel {

    weak var viewControllerDelegate: DetailsSceneViewController?
    var coordinatorDelegate: CoordinatorDelegate?
    var screenData: DetailsDomainItem
    
    init(_ item: DetailsDomainItem) {
        self.screenData = item
    }
    deinit { print("DetailsScreenViewModel deinit called.") }
    
    func showWebPage() {
        if let validURL = URL(string: screenData.webPagePath),
           UIApplication.shared.canOpenURL(validURL) {
            viewControllerDelegate?.webView.load(URLRequest(url: validURL))
        }
    }
}
