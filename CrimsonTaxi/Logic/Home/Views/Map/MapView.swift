//
//  MapView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit
import MapKit

class MapView: BaseUIView {
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    private func configure() {
        zoomToUserLocation(lat: 41.311199, lng: 69.279879)
    }
    func zoomToUserLocation(lat: Double, lng: Double) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lng), latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
}
