import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) { for view in views { addSubview(view) } }
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { rendererContext in
            layer.render(in: rendererContext.cgContext)
        })
    }
    func addShadow(color: UIColor) {
        layer.masksToBounds = false
        layer.shadowColor = color.withAlphaComponent(0.5).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
//        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    func removeShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.0).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: -3.0)
        layer.shadowOpacity = 0.0
        #warning("UIView.layer.shadowPath not working?")
//        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
