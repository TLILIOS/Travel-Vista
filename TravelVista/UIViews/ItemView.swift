//
//  ListItemView.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//
import SwiftUI

struct ItemView: View {
   
    var country: Country?
    
    var body: some View {
        HStack {
            if let country = country { Image(country.pictureName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image(systemName: "smiley.fill")
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
                    .foregroundStyle(.blue)
                // Capitale
                Text(country?.capital ?? "Capitale Fictive")
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            // Note du pays
            if let country = country {
                Text(String(country.rate))
                    .font(.subheadline)
                    .foregroundColor(.black)
                Image(systemName: "star.fill")
                    .foregroundStyle(.accent)
                            .imageScale(.large)
            } else {
                Text("4.5")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Image(systemName: "star.fill")
                    .foregroundStyle(.accent)
                            .imageScale(.large)
            }
        }
        .padding()
    }
}

#Preview {
    
    let sampleCoordinates = Coordinates(latitude: 48.8566, longitude: 2.3522)
    let sampleCountry = Country(
        name: "France",
        capital: "Paris",
        description: "Description de la France.",
        rate: 5,
        pictureName: "photo.france",
        coordinates: sampleCoordinates
    )
    
    return ItemView(country: sampleCountry)
}
