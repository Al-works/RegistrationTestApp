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

    // MARK: - User Interaction.

    @IBAction func submit(_ sender: Any) {

        guard let email = mailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), email.isEmpty == false else {
            let alertController: UIAlertController = .with(message: "Пожалуйста, укажите  Email")
            present(alertController, animated: true, completion: nil)
            return
        }

        guard email.isValidEmail else {
            let alertController: UIAlertController = .with(message: "Не валидный email")
            present(alertController, animated: true, completion: nil)
            return
        }

        let strotyboard  = UIStoryboard(name: "Main", bundle: nil)
        let vc  = strotyboard.instantiateViewController(withIdentifier: "CreatePasswordViewController")
        present(vc, animated: true, completion: nil)
    }
}
