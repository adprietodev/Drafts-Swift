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
        try draftManager.removeDraft(with: product.id, of: type)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try draftManager.buildFolderInsideDraftFolder(with: name, of: type)
    }

    func getDrafts(by userID: Int) throws -> [LocalProductDTO] {
        try draftManager.getAllDrafts(with: type, and: userID)
    }

    func save(_ product: LocalProductDTO, at userID: Int) throws {
        try draftManager.save(product, with: type, and: userID)
    }

    func remove(_ product: LocalProductDTO, at userID: Int) throws {
        try draftManager.removeDraft(with: product.id, of: type, and: userID)
    }

    func buildImageFolder(with name: String, at userID: Int) throws -> URL {
        try draftManager.buildFolderInsideDraftFolder(with: name, of: type, and: userID)
    }
}
