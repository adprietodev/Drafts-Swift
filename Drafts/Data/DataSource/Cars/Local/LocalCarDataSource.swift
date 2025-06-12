//
//  LocalCarDataSource.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class LocalCarDataSource: LocalCarDataSourceProtocol {
    // MARK: - Properties
    private let draftManager: DraftManagerProtocol
    private let type = LocalCarDTO.self

    // MARK: - Init
    init(draftManager: DraftManagerProtocol) {
        self.draftManager = draftManager
    }

    // MARK: - Function
    func saveDraft(_ car: LocalCarDTO) throws {
        try draftManager.save(car)
    }

    func getAllDrafts() throws -> [LocalCarDTO] {
        try draftManager.getAll(of: type)
    }

    func getDraft(with id: UUID) throws -> LocalCarDTO {
        try draftManager.get(id: id, of: type)
    }

    func removeDraft(with id: UUID) throws {
        try draftManager.remove(id: id, of: type)
    }
}
