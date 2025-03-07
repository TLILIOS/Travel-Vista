//
//  ListView.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            ForEach(0..<3) { section in
                Section(header: Text("Region \(section + 1)")) {
                    ForEach(0..<3) { _ in
                        ListItemView()
                    }
                }
            }
        }
        .navigationTitle("Liste de voyages")
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}
