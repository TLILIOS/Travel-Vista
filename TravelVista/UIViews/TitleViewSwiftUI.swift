//
//  TitleViewSwiftUI.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 23/02/2025.
//

import SwiftUI


struct TitleViewSwiftUI: View {
    let country: Country
   
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        HStack {
                // Title View
            VStack(alignment: .leading) {
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
                            .foregroundColor(.accentColor)
                    }
                }
            }
        .padding(.horizontal)
    }
}


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

