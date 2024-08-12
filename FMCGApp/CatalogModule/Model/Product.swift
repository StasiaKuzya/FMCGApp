//
//  Product.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import Foundation

struct Product: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let image: String?
    let price: Double
    let discount: Double?
    let badge: String?
    var isLiked: Bool
    let rating: Double?
    let isCountable: Bool // for price for item and weight
    let defaultCountForOneItem: Double
    var pickedItems: Int?
    let countryOfProduction: String?
    let reviews: Int?
}
