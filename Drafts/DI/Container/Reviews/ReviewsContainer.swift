//
//  ReviewsContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewsContainer {
    func makeUseCase() -> ReviewUseCase {
        let localDataSource = LocalReviewsDataSource(draftManager: FileSystemDraftsManager())
        let repository = ReviewsRepository(localDataSource: localDataSource)
        let imageUseCase = ImagesContainer().makeUseCase()
        return ReviewUseCase(repository: repository, imageUseCase: imageUseCase)
    }
}
