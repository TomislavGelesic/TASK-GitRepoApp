import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) { for view in views { addSubview(view) } }
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { rendererContext in
            layer.render(in: rendererContext.cgContext)
        })
    }
}
