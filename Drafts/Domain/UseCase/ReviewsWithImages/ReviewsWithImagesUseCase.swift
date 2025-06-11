//
//  ReviewsWithImagesUseCase.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 11/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewsWithImagesUseCase: ReviewsWithImagesUseCaseProtocol {
    // MARK: - Properties
    private let imagesUseCase: ImageUseCaseProtocol
    private let reviewsUseCase: ReviewUseCaseProtocol

    // MARK: - Init
    init(imagesUseCase: ImageUseCaseProtocol, reviewsUseCase: ReviewUseCaseProtocol) {
        self.imagesUseCase = imagesUseCase
        self.reviewsUseCase = reviewsUseCase
    }

    // MARK: - Functions
    func getDrafts() throws -> [Review] {
        var reviews = try reviewsUseCase.getDrafts()

        try reviews.enumerated().forEach { index, review in
            reviews[index].imageData = try imagesUseCase.loadImage(with: review.imagePath)
        }

        return reviews
    }

    func save(_ review: inout Review) throws {
        let imageFolder = try reviewsUseCase.buildImageFolder(with: "\(Constants.Image.folderName)\(review.draftID)")
        let imagePath = try imagesUseCase.buildImagePath(review.imageData, in: imageFolder, with: "review", imageExtension: .jpg)

        review.imagePath = imagePath

        try reviewsUseCase.save(review)
    }

    func remove(_ review: Review) throws {
        if let imagePath = review.imagePath {
            try imagesUseCase.removeImage(with: imagePath)
        }

        try reviewsUseCase.remove(review)
    }
}
