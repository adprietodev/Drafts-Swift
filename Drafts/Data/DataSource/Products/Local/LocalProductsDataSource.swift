//
//  LocalProductsDataSource.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class LocalProductsDataSource: LocalProductsDataSourceProtocol {
    // MARK: - Properties
    private let draftManager: FileSystemDraftsManagerProtocol
    private let type: LocalProductDTO.Type

    // MARK: - Init
    init(draftManager: FileSystemDraftsManagerProtocol) {
        self.draftManager = draftManager
        self.type = LocalProductDTO.self
    }

    // MARK: - Functions
    func getDrafts() throws -> [LocalProductDTO] {
        try draftManager.getAllDrafts(with: type)
    }

    func save(_ product: LocalProductDTO) throws {
        try draftManager.save(product, with: type)
    }

    func remove(_ product: LocalProductDTO) throws {
        try draftManager.removeDraft(with: product.id, with: type)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try draftManager.buildFolderInsideDraftFolder(with: name, with: type)
    }
}
