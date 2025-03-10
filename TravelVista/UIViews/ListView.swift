import SwiftUI
import Foundation

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.regions.indices, id: \.self) { sectionIndex in
                    Section(header:
                                Text(viewModel.regions[sectionIndex].name)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    )
                    {
                        Divider()
                        ForEach(viewModel.regions[sectionIndex].countries.indices, id: \.self)
                        { countryIndex in
                            let country = viewModel.regions[sectionIndex].countries[countryIndex]
                            NavigationLink(destination: DetailView(country: country)) {
                                ItemView(country: country)
                            }
                            Divider()
                        }
                    }
                }
            }
            .navigationTitle("Liste de voyages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListView()
}
