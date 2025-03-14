
//
//  DetailViewController.swift
//  TravelVista
//
//  Created by Hamdi Tlili on 18/12/2023.
//
import SwiftUI
import UIKit
import MapKit

final class DetailViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var embedMapView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var rateView: UIView!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCustomDesign()
        
        // Vérifier que le pays est défini avant de l'utiliser
        guard let country = self.country else {
            print("Erreur: Pays non défini dans DetailViewController")
            return
        }
        
        // Créer TitleViewSwiftUI avec le pays validé
        let hostingController = UIHostingController(rootView: TitleViewSwiftUI(country: country))
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        hostingController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        // Vérifier que le titleView est initialisé avant de l'utiliser
        if let titleView = self.titleView {
            hostingController.view.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -40).isActive = true
            titleView.isHidden = true
        } else {
            // Si titleView n'est pas disponible, placer le hostingController en haut de la vue
            hostingController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        }
        
        hostingController.view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Configurer la vue avec les données du pays
        self.setUpData(country: country)
    }
    
    private func setUpData(country: Country) {
        // Définir le titre de la vue
        self.title = country.name
        
        // Vérifier que les IBOutlets sont initialisés avant de les utiliser
        if let imageView = self.imageView {
            imageView.image = UIImage(named: country.pictureName)
        }
        
        if let descriptionTextView = self.descriptionTextView {
            descriptionTextView.text = country.description
        }
        
        // Configurer la carte avec les coordonnées du pays
        self.setMapLocation(lat: country.coordinates.latitude,
                            long: country.coordinates.longitude)
    }
    
    private func setCustomDesign() {
        // Vérifier que tous les IBOutlets sont initialisés avant de les utiliser
        guard let mapView = self.mapView,
              let embedMapView = self.embedMapView,
              let mapButton = self.mapButton else {
            print("Avertissement: IBOutlets non initialisés dans setCustomDesign")
            return
        }
        
        // Configuration des éléments UI
        mapView.layer.cornerRadius = mapView.frame.size.width / 2
        embedMapView.layer.cornerRadius = embedMapView.frame.size.width / 2
        mapButton.layer.cornerRadius = mapButton.frame.size.width / 2
        
        mapView.layer.borderColor = UIColor(named: "CustomSand")?.cgColor
        mapView.layer.borderWidth = 2
    }
    
    private func setMapLocation(lat: Double, long: Double) {
        // Vérifier que mapView est initialisé avant de l'utiliser
        guard let mapView = self.mapView else {
            print("Avertissement: mapView non initialisé dans setMapLocation")
            return
        }
        
        let initialLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
    }
    
    
    @IBAction func showMap(_ sender: Any) {
        guard let country = self.country else {
            print("Erreur: Pays non défini lors de l'ouverture de la carte")
            return
        }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController: MapViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        nextViewController.setUpData(capitalName: country.capital, lat: country.coordinates.latitude, long: country.coordinates.longitude)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
