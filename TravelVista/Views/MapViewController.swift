//
//  MapViewController.swift
//  TravelVista
//
//  Created by Amandine Cousin on 18/12/2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var coordinates: CLLocationCoordinate2D? = nil
    var capitalName: String? = nil
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let coordinates = self.coordinates,
           let capitalName = self.capitalName {
            self.setMapLocation(coordinates: coordinates)
            self.setMapPins(coordinates: coordinates, capitalName: capitalName)
        }
    }
    
    func setUpData(capitalName: String?, lat: Double, long: Double) {
        self.capitalName = capitalName
        self.coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    private func setMapLocation(coordinates: CLLocationCoordinate2D) {
        let initialLocation = coordinates
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        self.mapView.setRegion(region, animated: true)
        self.mapView.delegate = self
    }
    
    private func setMapPins(coordinates: CLLocationCoordinate2D, capitalName: String) {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        pin.title = capitalName
        mapView.addAnnotation(pin)
    }
}

