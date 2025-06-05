//
//  ReviewsRepository.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewsRepository: ReviewRepositoryProtocol {
    // MARK: - Properties
    private let localDataSource: LocalReviewsDataSourceProtocol

    // MARK: - Init
    init(localDataSource: LocalReviewsDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    func getDrafts() throws -> [Review] {
        let reviewsDTO = try localDataSource.getDrafts()
        return reviewsDTO.map { $0.toDomain() }
    }

    func save(_ review: Review) throws {
        let reviewDTO = review.toDTO()
        try localDataSource.save(reviewDTO)
    }

    func remove(with id: UUID) throws {
        try localDataSource.remove(with: id)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try localDataSource.buildImageFolder(with: name)
    }
}

// MARK: - Mappers
fileprivate extension LocalReviewDTO {
    func toDomain() -> Review {
        Review(draftID: self.id,
               title: self.title,
               content: self.content,
               rating: self.rating,
               productId: self.productId,
               authorName: self.authorName,
               imagePath: self.imagePath,
               isRecommended: self.isRecommended,
               tags: self.tags)
    }
}

fileprivate extension Review {
    func toDTO() -> LocalReviewDTO {
        LocalReviewDTO(id: self.draftID,
                       title: self.title,
                       content: self.content,
                       rating: self.rating,
                       productId: self.productId,
                       authorName: self.authorName,
                       imagePath: self.imagePath ?? "",
                       isRecommended: self.isRecommended,
                       tags: self.tags)
    }
}
