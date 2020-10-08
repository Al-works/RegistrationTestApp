import UIKit
import CoreLocation
import GoogleMaps

class MapViewConroller: UIViewController {

    // MARK: - UI Properties.

    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var unlockButton: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    
    // MARK: - Properties.

    private let locationManager = LocationManager.shared
    
    // MARK: - Lifecycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        requestLocationPermission()
    }

    // MARK: - Private Methods.

    private func initView() {
        mapView.delegate = self
        locationButton.layer.cornerRadius = locationButton.bounds.height / 2
        settingsButton.layer.cornerRadius = settingsButton.bounds.height / 2
        unlockButton.layer.cornerRadius = unlockButton.bounds.height / 2
        setupMap()
    }

    private func setupMap() {
        mapView.layer.cornerRadius = 22
        mapView.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner ]
        mapView.mapStyle = SampleMapStyle.night.mapStyle

    }

    private func requestLocationPermission() {
        locationManager.fetchCoordinate(askingForPermission: true) { [weak self] (coordinate) in
            self?.handleCoordinate(coordinate)
        }
    }

    private func handleCoordinate(_ coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }

        mapView.isMyLocationEnabled = true
        mapView.camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 16)
    }
    

    // MARK: - User Interaction.

    @IBAction func unlock(_ sender: Any) {
    }

    @IBAction func showCurrentLocation(_ sender: Any) {
        requestLocationPermission()
    }

    @IBAction func openSettings(_ sender: Any) {
    }
}

extension MapViewConroller: GMSMapViewDelegate {

}
