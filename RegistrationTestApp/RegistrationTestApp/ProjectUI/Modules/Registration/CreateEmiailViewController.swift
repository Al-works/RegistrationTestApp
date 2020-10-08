import Foundation
import UIKit

class CreateEmiailViewController: UIViewController {

    // MARK: - UI Properties.

    @IBOutlet weak var mailTextField: UITextField!

    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        mailTextField.becomeFirstResponder()
    }

    // MARK: - Private Methods.

    private func showAlert(message: String) {
        let alertController: UIAlertController = .with(message: message)
        present(alertController, animated: true, completion: nil)
    }

    // MARK: - User Interaction.

    @IBAction func submit(_ sender: Any) {
//        guard
//            let email = mailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
//            email.isEmpty == false else {
//            showAlert(message: "Пожалуйста, укажите  Email")
//            return
//        }
//
//        guard email.isValidEmail else {
//            showAlert(message: "Не валидный Email")
//            return
//        }

        let strotyboard = UIStoryboard(name: "Registration", bundle: nil)
        let vc = strotyboard.instantiateViewController(withIdentifier: "CreatePasswordViewController")
        present(vc, animated: true, completion: nil)
    }
}
