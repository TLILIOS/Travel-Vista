//
//  ListViewModel.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var regions: [Region]
    
    init() {
        // Chargement des données depuis le Service
        self.regions = Service().load("Source.json")
    }
}

