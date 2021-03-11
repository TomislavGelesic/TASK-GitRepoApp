
import UIKit

protocol CoordinatorDelegate: class {
    func goToSearchScene()
    func goToResultScene(_ option: ResultSceneOption)
    func goToDetailScreen(_ info: DetailsDomainItem)
}
