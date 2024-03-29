//
//  Product.swift
//  Online Clothes Shoping
//
//  Created by NIBM-LAB04-PC04 on 2024-03-26.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    
}

var productList = [Product(name: "1222", image: "sweater1", price: 54),
                   Product(name: "asd", image: "sweater2", price: 89),
                   Product(name: "addd", image: "sweater3", price: 79),
                   Product(name: "adwde", image: "sweater4", price: 94),
                   Product(name: "asce", image: "sweater5", price: 99),
                   Product(name: "Bcdced", image: "sweater6", price: 65),
                   Product(name: "cdcc", image: "sweater7", price: 54),
                   Product(name: "dved", image: "sweater8", price: 83)]
