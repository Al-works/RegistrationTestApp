import Foundation
import UIKit

class CreatePasswordViewController: UIViewController {

    // MARK: - UI Properties.

    @IBOutlet weak var passwordTextField: UITextField!

    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.becomeFirstResponder()
    }

    // MARK: - User Interaction.

    @IBAction func submit(_ sender: Any) {

        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), password.count > 6 else {
            let alertController: UIAlertController = .with(message: "Пожалуйста, укажите  Password")
            present(alertController, animated: true, completion: nil)
            return
        }


//        let strotyboard  = UIStoryboard(name: "Main", bundle: nil)
//        let vc  = strotyboard.instantiateViewController(withIdentifier: "CreateEmiailViewController")
//        present(vc, animated: true, completion: nil)
    }
}
