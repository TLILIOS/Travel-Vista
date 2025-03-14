import SwiftUI
import Foundation

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.regions, id: \.name) { region in
                    RegionSection(region: region)
                }
                .navigationTitle("Liste de voyages")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
#Preview {
    ListView()
}
