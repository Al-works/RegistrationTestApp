import Foundation
import UIKit

class BorderedButton: UIButton {

    // MARK: - Computed Properties.

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 63)
    }

    // MARK: - Lifecycle.

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 2
        layer.borderColor = tintColor.cgColor
    }
}
