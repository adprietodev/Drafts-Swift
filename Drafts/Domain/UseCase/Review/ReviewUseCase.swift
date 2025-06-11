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

    init(repository: ReviewRepositoryProtocol) {
        self.repository = repository
    }

    func getDrafts() throws -> [Review] {
        try repository.getDrafts()
    }

    func save(_ review: Review) throws {
        try repository.save(review)
    }

    func remove(_ review: Review) throws {
        try repository.remove(with: review.draftID)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try repository.buildImageFolder(with: name)
    }
}
