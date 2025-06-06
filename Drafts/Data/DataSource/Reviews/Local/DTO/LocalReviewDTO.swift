//
//  LocalReviewDTO.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

struct LocalReviewDTO: Draftable {
    var id: UUID

    var title: String
    var content: String
    var rating: Int
    var productId: String
    var authorName: String
    var imagePath: String
    var isRecommended: Bool
    var tags: [String]
}
