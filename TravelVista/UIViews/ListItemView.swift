//
//  ListItemView.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//
import SwiftUI

struct ListItemView: View {
    // Ajout d'une propriété pour stocker les données du pays
    var country: Country? = nil
    
    var body: some View {
        HStack {
            // Image du pays avec le même style que dans CustomCell
            if let country = country, let image = UIImage(named: country.pictureName) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .background(Color.gray.opacity(0.2))
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .background(Color.gray.opacity(0.2))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                // Nom du pays
                Text(country?.name ?? "Lorem Ipsum")
                    .font(.headline)
                
                // Capitale
                Text(country?.capital ?? "Capitale Fictive")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Note du pays
            if let country = country {
                Text(String(country.rate))
                    .font(.headline)
                    .foregroundColor(.blue)
            } else {
                Text("4.5")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    // Création d'un pays de démonstration pour le preview
    let sampleCoordinates = Coordinates(latitude: 48.8566, longitude: 2.3522)
    let sampleCountry = Country(
        name: "France",
        capital: "Paris",
        description: "Description de la France.",
        rate: 5,
        pictureName: "france",
        coordinates: sampleCoordinates
    )
    
    return ListItemView(country: sampleCountry)
}
