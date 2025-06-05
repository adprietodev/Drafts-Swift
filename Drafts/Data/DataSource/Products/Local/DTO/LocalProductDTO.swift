//
//  ProductDTO.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

struct LocalProductDTO: DraftDTOProtocol {
    var id: UUID
    var name: String
    var description: String
    var price: Double
    var category: String
    var brand: String
    var imagePath: String
    var isAvailable: Bool
    var stockQuantity: Int
}
