//
//  LocalReviewsDataSource.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class LocalReviewsDataSource: LocalReviewsDataSourceProtocol {
    // MARK: - Properties
    private let draftManager: FileSystemDraftsManagerProtocol
    private let type: LocalReviewDTO.Type

    // MARK: - Init
    init(draftManager: FileSystemDraftsManagerProtocol) {
        self.draftManager = draftManager
        self.type = LocalReviewDTO.self
    }

    // MARK: - Functions
    func getDrafts() throws -> [LocalReviewDTO] {
        try draftManager.getAllDrafts(with: type)
    }

    func save(_ review: LocalReviewDTO) throws {
        try draftManager.save(review, with: type)
    }

    func remove(with id: UUID) throws {
        try draftManager.removeDraft(with: id, with: type)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try draftManager.buildFolderInsideDraftFolder(with: name, with: type)
    }
}
