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
        let reviewUseCase = ReviewsContainer().makeUseCase()
        let viewModel = ReviewsViewModel(reviewUseCase: reviewUseCase)
        return ReviewsView(viewModel: viewModel)
    }
}
