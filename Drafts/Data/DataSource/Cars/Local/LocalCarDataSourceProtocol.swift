//
//  LocalCarDataSourceProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol LocalCarDataSourceProtocol {
    func saveDraft(_ car: LocalCarDTO) throws
    func getAllDrafts() throws -> [LocalCarDTO]
    func getDraft(with id: UUID) throws -> LocalCarDTO
    func removeDraft(with id: UUID) throws
}
