//
//  DetailView.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//
import SwiftUI
import UIKit

// Cette structure permet de représenter le DetailViewController UIKit dans SwiftUI
struct DetailView: UIViewControllerRepresentable {
    // Propriété pour stocker le pays à afficher
    var country: Country
    
    // Fonction 1: Création du UIViewController programmatiquement
    func makeUIViewController(context: Context) -> DetailViewController {
        // Création d'une instance du DetailViewController directement
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Impossible de créer le DetailViewController")
        }
        
        // Affectation du pays à la propriété country du DetailViewController
        detailViewController.country = country
        
        return detailViewController
    }
    
    // Fonction 2: Mise à jour du UIViewController (non utilisée dans notre cas)
    func updateUIViewController(_ viewController: DetailViewController, context: Context) {
        // Cette fonction est requise par le protocole mais n'a pas besoin d'implémentation
        // car notre vue est statique et ne change pas après son chargement initial
    }
}

// Preview pour le DetailView
#Preview {
    // Création d'un pays de démonstration pour le preview
    let sampleCoordinates = Coordinates(latitude: 48.8566, longitude: 2.3522)
    let sampleCountry = Country(
        name: "France",
        capital: "Paris",
        description: "Description de la France avec des informations touristiques.",
        rate: 5,
        pictureName: "france",
        coordinates: sampleCoordinates
    )
    
    // Retourne une DetailView avec le pays de démonstration
    NavigationView {
        DetailView(country: sampleCountry)
    }
}
