import UIKit

class DividerView: UIView {

    // MARK: - Lifecycle.
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        layer.cornerRadius = 0.5
    }
}
