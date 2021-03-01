import UIKit

extension UICollectionViewCell: ReusableView {
    
    static var reuseIdentifier: String { return String(describing: self) }
}
