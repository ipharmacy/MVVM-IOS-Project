//
//  Product.swift
//  IC
//
//  Created by Dhia Benhamouda on 13.12.21.
//


import Foundation

struct Product: Codable {
    let _id: String
    let image: [String]
    let name: String
    let description: String
    let brand: String
    let category: String
    let address: String
}
