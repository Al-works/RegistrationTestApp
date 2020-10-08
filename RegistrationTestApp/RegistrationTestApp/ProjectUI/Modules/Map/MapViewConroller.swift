import Foundation
import UIKit

class MapViewConroller: UIViewController {

    // MARK: - UI Properties.

    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var unlockButton: UIButton!

    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    // MARK: - Private Methods.

    func initView() {
        locationButton.layer.cornerRadius = locationButton.bounds.height / 2
        settingsButton.layer.cornerRadius = settingsButton.bounds.height / 2
        unlockButton.layer.cornerRadius = unlockButton.bounds.height / 2
        view.layer.cornerRadius = 22
        view.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner ]
    }

    // MARK: - User Interaction.

    @IBAction func unlock(_ sender: Any) {
    }

    @IBAction func findLocation(_ sender: Any) {
    }

    @IBAction func openSettings(_ sender: Any) {
    }
}
