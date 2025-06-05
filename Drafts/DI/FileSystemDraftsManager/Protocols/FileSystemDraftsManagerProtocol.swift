//
//  DraftLocalManagerProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol FileSystemDraftsManagerProtocol {
    func save<T: DraftDTOProtocol>(_ draft: T, with type: T.Type) throws
    func getAllDrafts<T: DraftDTOProtocol>(with type: T.Type) throws -> [T]
    func getDraft<T: DraftDTOProtocol>(with id: UUID, with type: T.Type) throws -> T
    func removeDraft<T: DraftDTOProtocol>(with id: UUID, with type: T.Type) throws
    func buildFolderInsideDraftFolder<T: DraftDTOProtocol>(with name: String, with type: T.Type) throws -> URL
}
