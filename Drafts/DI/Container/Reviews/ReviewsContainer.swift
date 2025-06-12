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
        let fileSystemDraftManager = FileSystemDraftManagerContainer.build()
        let localDataSource = LocalReviewsDataSource(draftManager: fileSystemDraftManager)
        let repository = ReviewsRepository(localDataSource: localDataSource)
        return ReviewUseCase(repository: repository)
    }
}
