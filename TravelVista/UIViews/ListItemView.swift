//
//  ListItemView.swift
//  TravelVista
//
//  Created by TLiLi Hamdi on 07/03/2025.
//
import SwiftUI

struct ListItemView: View {
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Lorem Ipsum")
                    .font(.headline)
                Text("Description du pays")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ListItemView()
}
