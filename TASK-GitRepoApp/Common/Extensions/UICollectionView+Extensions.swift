import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell> (for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
        else { fatalError("Unable to dequeue reusable collection view cell.") }
        return cell
    }
}
