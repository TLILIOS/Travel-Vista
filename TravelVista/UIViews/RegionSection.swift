//
//  RegionSection.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 14/03/2025.
//

import SwiftUI

struct RegionSection: View {
    let region: Region
    var body: some View {
        VStack(alignment: .leading, spacing: -10) {
                    Text(region.name)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Divider()
                    
            ForEach(region.countries, id: \.name) { country in
                        NavigationLink(destination: DetailView(country: country)) {
                            ItemView(country: country)
                        }
                        Divider()
                    }
                }
            }
        }


#Preview {
    RegionSection(region: Region(
        name: "Europe",
        countries: [
            Country(name: "France", capital: "Paris", description: "Pays du vin et de la gastronomie", rate: 5, pictureName: "france", coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522)),
            Country(name: "Italie", capital: "Rome", description: "Pays de la pizza et du Colisée", rate: 4, pictureName: "italie", coordinates: Coordinates(latitude: 41.9028, longitude: 12.4964)),
            Country(name: "Allemagne", capital: "Berlin", description: "Pays des saucisses et de la bière", rate: 4, pictureName: "allemagne", coordinates: Coordinates(latitude: 52.52, longitude: 13.405))
        ]
    ))
}
