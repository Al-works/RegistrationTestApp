import Foundation
import UIKit

class CreateNameViewController: UIViewController {

    // MARK: - UI Properties.

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    // MARK: - Properties.

    private var unsavedUserCredentials = UnsavedUserCredentials()

    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.becomeFirstResponder()
    }

    // MARK: - User Interaction.

    @IBAction func submit(_ sender: Any) {
        unsavedUserCredentials.firstName = firstNameTextField.text
        unsavedUserCredentials.lastName = lastNameTextField.text

//        switch unsavedUserCredentials.state {
//        case .unready (let message):
//            let alertController: UIAlertController = .with(message: message)
//            present(alertController, animated: true, completion: nil)
//        case .ready (_, _):
            let strotyboard = UIStoryboard(name: "Registration", bundle: nil)
            let vc = strotyboard.instantiateViewController(withIdentifier: "CreateEmiailViewController")
           present(vc, animated: true, completion: nil)
//        }
    }
}
