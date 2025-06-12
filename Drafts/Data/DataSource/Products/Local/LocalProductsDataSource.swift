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
        try draftManager.getAll(of: type)
    }

    func save(_ product: LocalProductDTO) throws {
        try draftManager.save(product)
    }

    func remove(_ product: LocalProductDTO) throws {
        try draftManager.remove(id: product.id, of: type)
    }

    func buildImageFolder(with name: String) throws -> URL {
        try draftManager.createFolderInsideDraftFolder(name: name, of: type, userID: nil)
    }

    func getDrafts(by userID: Int) throws -> [LocalProductDTO] {
        try draftManager.getAll(of: type, userID: userID)
    }

    func save(_ product: LocalProductDTO, at userID: Int) throws {
        try draftManager.save(product, userID: userID)
    }

    func remove(_ product: LocalProductDTO, at userID: Int) throws {
        try draftManager.remove(id: product.id, of: type, userID: userID)
    }

    func buildImageFolder(with name: String, at userID: Int) throws -> URL {
        try draftManager.createFolderInsideDraftFolder(name: name, of: type, userID: userID)
    }
}
