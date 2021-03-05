
import UIKit
import SnapKit

extension UIViewController {
    
    func showSpinner() { SpinnerViewManager.addSpinnerView(to: self.view) }
    func hideSpinner() { SpinnerViewManager.removeSpinnerView() }
    
    func showAlert(text errorMessage: String, completion: @escaping ()->()) {
        let alert = UIAlertController(title: "Sorry", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in completion() }))
        DispatchQueue.main.async { [unowned self] in self.present(alert, animated: true) }
    }
    
    func showInfoText (text: String) {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        self.view.insertSubview(label, at: 100)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(-100)
        }
        
    }
}
