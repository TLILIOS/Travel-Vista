//
//  ListViewModel.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//

import Foundation
@MainActor
final class ListViewModel: ObservableObject {
    @Published var regions: [Region]
    
    init() {
        self.regions = Service().load("Source.json")
    }
}

