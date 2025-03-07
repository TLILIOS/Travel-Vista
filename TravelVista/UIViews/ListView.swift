import SwiftUI
import Foundation

struct ListView: View {
    // ViewModel pour gérer les données des pays
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // Affichage des pays regroupés par région
                ForEach(viewModel.regions.indices, id: \.self) { sectionIndex in
                    Section(header: Text(viewModel.regions[sectionIndex].name)) {
                        ForEach(viewModel.regions[sectionIndex].countries.indices, id: \.self) { countryIndex in
                            // Ajout du NavigationLink vers DetailView avec le pays correspondant
                            let country = viewModel.regions[sectionIndex].countries[countryIndex]
                            NavigationLink(destination: DetailView(country: country)) {
                                ListItemView(country: country)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Liste de voyages")
        }
    }
}

#Preview {
    ListView()
}
