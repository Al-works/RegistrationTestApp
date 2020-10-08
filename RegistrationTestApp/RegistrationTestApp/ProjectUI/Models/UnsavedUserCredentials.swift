import Foundation

struct UnsavedUserCredentials {

    // MARK: - Properties.

    var firstName: String?
    var lastName: String?

    // MARK: - Computed Properties.

    var state: State {
        guard let firstName = firstName?.trimmingCharacters(in: .whitespacesAndNewlines), firstName.isEmpty == false else {
            return .unready(message: "Пожалуйста, укажите First name")
        }

        guard let lastName = lastName?.trimmingCharacters(in: .whitespacesAndNewlines), lastName.isEmpty == false else {
            return .unready(message: "Пожалуйста, укажите Last name")
        }

        return .ready(firstName: firstName, lastName: lastName)
    }

}

extension UnsavedUserCredentials {
    enum State {
        case unready (message: String)
        case ready (firstName: String, lastName: String)
    }
}
