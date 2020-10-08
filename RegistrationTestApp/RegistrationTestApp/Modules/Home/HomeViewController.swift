
import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Properties.

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var freeButton: UIButton!

    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    // MARK: - Private Methods.

    func initView() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        moneyLabel.layer.cornerRadius = moneyLabel.bounds.height / 2
        freeButton.layer.cornerRadius = 4
        mapContainerView.layer.cornerRadius = 22
        mapContainerView.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner ]

        bottomView.layer.cornerRadius = 19
        bottomView.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner ]
    }

    // MARK: - User Interaction.

    @IBAction func getFree(_ sender: Any) {
    }

    
}
