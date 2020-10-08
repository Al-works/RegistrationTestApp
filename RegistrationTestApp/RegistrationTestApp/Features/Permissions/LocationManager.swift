import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {

    // MARK: - Properties.

    private let locationManager = CLLocationManager()
    private var completion:((_ coordinate: CLLocationCoordinate2D?) -> Void)?
    var coordinate: CLLocationCoordinate2D?

    // MARK: - Initialization.

    static let shared = LocationManager()

    override private init() {
        super.init()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    // MARK: - Public Methods.

    func fetchCoordinate(askingForPermission: Bool, then completion: @escaping ((_ coordinate: CLLocationCoordinate2D?) -> Void)) {
        let status = CLLocationManager.authorizationStatus()
        self.completion = completion

        DispatchQueue.main.async { [weak self] in
            self?.handleStatus(status, askingForPermission: askingForPermission)
        }
    }

    func checkStatus(then completion: @escaping (_ status: CLAuthorizationStatus) -> Void) {
        let status = CLLocationManager.authorizationStatus()

        DispatchQueue.main.async {
            completion(status)
        }
    }

    // MARK: - Private Methods.

    private func handleStatus(_ status: CLAuthorizationStatus, askingForPermission: Bool) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            completion?(locationManager.location?.coordinate)
        case .notDetermined:
            if askingForPermission {
                locationManager.requestWhenInUseAuthorization()
            }
            else {
                completion?(nil)
            }
        default:

            if askingForPermission {
                showAlert()
            }

            completion?(nil)
        }
    }

    private func showAlert() {
        let alert = UIAlertController.settingsAlert(title: "Geolocation", message: "Enable geolocation services for\napplication to work correctly")
        UIViewController.current()?.present(alert, animated: true)
    }

    // MARK: - CLLocationManagerDelegate.

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.main.async { [weak self] in
            self?.completion?(self?.locationManager.location?.coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        coordinate = locationManager.location?.coordinate
    }
}
