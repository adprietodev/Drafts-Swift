//
//  Review.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

struct Review {
    var draftID = UUID()
    var title: String
    var content: String
    var rating: Int
    var productId: String
    var authorName: String
    var imagePath: String?
    var imageData: Data?
    var isRecommended: Bool
    var tags: [String]
}
