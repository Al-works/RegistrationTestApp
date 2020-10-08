import GoogleMaps

enum SampleMapStyle: CustomStringConvertible, CaseIterable {
    case night

    private static let mapStyleJSON = """
    [
      {
        "featureType" : "poi.business",
        "elementType" : "all",
        "stylers" : [
          {
            "visibility" : "off"
          }
        ]
      },
      {
        "featureType" : "transit",
        "elementType" : "labels.icon",
        "stylers" : [
          {
            "visibility" : "off"
          }
        ]
      }
    ]
    """

    var description: String {
        switch self {
        case .night:
            return "Night"
        }
    }

    var mapStyle: GMSMapStyle? {
        switch self {
        case .night:
            return try? GMSMapStyle(named: "mapstyle-night")
        }
    }
}

extension GMSMapStyle {
  convenience init?(named fileName: String) throws {
    guard let styleURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
      return nil
    }
    try self.init(contentsOfFileURL: styleURL)
  }
}
