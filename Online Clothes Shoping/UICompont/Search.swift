//
//  Serachbar.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-03-29.
//

import SwiftUI

struct Search: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                // Handle search action
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(searchText: .constant(""))
    }
}
