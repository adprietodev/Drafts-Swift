//
//  ReviewUseCase.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewUseCase: ReviewUseCaseProtocol {
    private let repository: ReviewRepositoryProtocol
    private let imageUseCase: ImageUseCaseProtocol

    init(repository: ReviewRepositoryProtocol, imageUseCase: ImageUseCaseProtocol) {
        self.repository = repository
        self.imageUseCase = imageUseCase
    }

    func getDrafts() throws -> [Review] {
        var reviews = try repository.getDrafts()

        try reviews.enumerated().forEach { index, review in
            reviews[index].imageData = try imageUseCase.loadImage(with: review.imagePath)
        }

        return reviews
    }

    func save(_ review: inout Review) throws {
        let imageFolder = try repository.buildImageFolder(with: "\(Constants.Image.folderName)\(review.draftID)")
        let imagePath = try imageUseCase.buildImagePath(review.imageData, in: imageFolder, with: "review", imageExtension: .jpg)

        review.imagePath = imagePath

        try repository.save(review)
    }

    func remove(_ review: Review) throws {
        if let imagePath = review.imagePath {
            try imageUseCase.removeImage(with: imagePath)
        }

        try repository.remove(with: review.draftID)
    }
}
