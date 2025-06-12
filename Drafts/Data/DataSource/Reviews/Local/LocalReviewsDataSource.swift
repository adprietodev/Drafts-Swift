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
        try draftManager.getAll(of: type)
    }

    func save(_ review: LocalReviewDTO) throws {
        try draftManager.save(review)
    }

    func remove(with id: UUID) throws {
        try draftManager.remove(id: id, of: type)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try draftManager.createFolderInsideDraftFolder(name: name, of: type, userID: nil)
    }
}
