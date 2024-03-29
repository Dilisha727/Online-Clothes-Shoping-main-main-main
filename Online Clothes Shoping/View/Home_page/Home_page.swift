//
//  Home_page.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct Home_page: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @StateObject var navigationViewModel = NavigationViewModel() // Create instance of NavigationViewModel
        
     
    var body: some View {
        NavigationView {
            VStack {
            
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                BottomNavBarViewModel(viewModel: navigationViewModel)
                                    .padding(.bottom, 1) // Optional padding
                                
            }
            .navigationTitle(Text("Shopping Mall"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_page_Previews: PreviewProvider {
    static var previews: some View {
        Home_page()
    }
}
