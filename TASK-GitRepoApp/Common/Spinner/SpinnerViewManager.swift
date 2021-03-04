
import UIKit
import SnapKit

class SpinnerViewManager {
    static let spinnerView: SpinnerView = {
        let spinner = SpinnerView()
        return spinner
    }()
    static func addSpinnerView(to view: UIView) {
        view.insertSubview(spinnerView, at: 100)
        spinnerView.snp.makeConstraints { (make) in make.edges.equalTo(view) }
    }
    static func removeSpinnerView() { spinnerView.removeFromSuperview() }
}
