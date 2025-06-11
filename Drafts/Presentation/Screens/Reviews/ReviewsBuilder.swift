//
//  ProductBuilder.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewsBuilder {
    static func build() -> ReviewsView {
        let reviewsWithImagesUseCase = ReviewsWithImagesContainer.makeUseCase()
        let viewModel = ReviewsViewModel(reviewsWithImagesUseCase: reviewsWithImagesUseCase)
        return ReviewsView(viewModel: viewModel)
    }
}
