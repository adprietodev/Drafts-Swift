//
//  ReviewsWithImagesContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 11/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewsWithImagesContainer {
    static func makeUseCase() -> ReviewsWithImagesUseCase {
        let reviewsUseCase = ReviewsContainer().makeUseCase()
        let imagesUseCase = ImagesContainer().makeUseCase()
        return ReviewsWithImagesUseCase(imagesUseCase: imagesUseCase, reviewsUseCase: reviewsUseCase)
    }
}
