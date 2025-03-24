//
//  TitleViewSwiftUI.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 23/02/2025.
//

import SwiftUI
<<<<<<< HEAD
import MapKit

struct TitleViewSwiftUI: View {
    let country: Country
    @State private var region: MKCoordinateRegion
    
    init(country: Country) {
        self.country = country
        _region = State(initialValue: MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: country.coordinates.latitude,
                        longitude: country.coordinates.longitude
                    ),
                    span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                ))
=======


struct TitleViewSwiftUI: View {
    let country: Country
   
    
    init(country: Country) {
        self.country = country
>>>>>>> TitleViewSwiftUI
    }
    
    var body: some View {
        HStack {
                // Title View
                VStack {
                    Text(country.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(country.capital)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
            Spacer()
                // Rate View
                HStack {
                    ForEach(0..<country.rate, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
        .padding(.horizontal)
    }
}

// Preview
struct TitleViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TitleViewSwiftUI(country: Country(
            name: "Nepal",
                           capital: "Kathmandu",
                           description: "Beautiful country with mountains",
                           rate: 5,
                           pictureName: "nepal",
                           coordinates: Coordinates(latitude: 28.394857, longitude: 84.124008)
        ))
    }
}

