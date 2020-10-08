import GoogleMaps

struct DependenciesManager {

    // MARK: - Public Methods.

    func addDependencies() {
        addGoogleKey()
    }

    // MARK: - Private Methods.

    private func addGoogleKey() {
        GMSServices.provideAPIKey("AIzaSyD53oIeEd-2f5NfyWQQOqrO4a1wsufAT1o")
    }

}
