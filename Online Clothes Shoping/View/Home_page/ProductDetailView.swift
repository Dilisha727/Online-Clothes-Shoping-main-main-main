//
//  ProductDetailView.swift
//  Online Clothes Shoping
//
//  Created by NIBM-LAB04-PC04 on 2024-03-26.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @State private var selectedSize: String = "XL" // Default selected size
    
    var body: some View {
        HStack(spacing: 20) {
            // Left-hand side: Product image
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            // Right-hand side: Details
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title)
                
                Text("\(product.price)$")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                // Size selection
                Text("Select Size:")
                    .font(.headline)
                
                HStack(spacing: 20) {
                    RadioButton(size: "XL", label: "XL", isSelected: selectedSize == "XL") {
                        selectedSize = "XL"
                    }
                    RadioButton(size: "L", label: "L", isSelected: selectedSize == "L") {
                        selectedSize = "L"
                    }
                    RadioButton(size: "S", label: "S", isSelected: selectedSize == "S") {
                        selectedSize = "S"
                    }
                }
            }
            .padding()
        }
        .padding()
        .navigationTitle(Text("Product Details"))
    }
}

struct RadioButton: View {
    var size: String
    var label: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                ZStack {
                    Circle()
                        .strokeBorder(Color.black, lineWidth: 2)
                        .frame(width: 30, height: 30)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .foregroundColor(.black)
            
            Text(label)
                .font(.caption)
        }
    }
}
