//
//  DetailView.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//
import SwiftUI
import UIKit

// le DetailViewController UIKit dans SwiftUI
struct DetailView: UIViewControllerRepresentable {
   
    let country: Country
    
    func makeUIViewController(context: Context) -> DetailViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Impossible de créer le DetailViewController")
        }
        
        
        detailViewController.country = country
        
        return detailViewController
    }
    
    
    func updateUIViewController(_ viewController: DetailViewController, context: Context) {
    }
}

#Preview {
    
    let sampleCoordinates = Coordinates(latitude: 48.8566, longitude: 2.3522)
    let sampleCountry = Country(
        name: "France",
        capital: "Paris",
        description: "Description de la France avec des informations touristiques.",
        rate: 5,
        pictureName: "france",
        coordinates: sampleCoordinates
    )
    
    NavigationView {
        DetailView(country: sampleCountry)
    }
}
