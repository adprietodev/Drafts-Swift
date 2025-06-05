//
//  Product.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

struct Product {
    var draftID = UUID()
    var name: String
    var description: String
    var price: Double
    var category: String
    var brand: String
    var imagePath: String?
    var imageData: Data?
    var isAvailable: Bool
    var stockQuantity: Int

    var formatedPrice: String {
        String(format: "%.2f", self.price)
    }
}
