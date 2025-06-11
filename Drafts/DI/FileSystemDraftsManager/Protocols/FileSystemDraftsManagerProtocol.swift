//
//  DraftLocalManagerProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol FileSystemDraftsManagerProtocol {
    func save<T: Draftable>(_ draft: T, with type: T.Type) throws
    func getAllDrafts<T: Draftable>(with type: T.Type) throws -> [T]
    func getDraft<T: Draftable>(with id: UUID, of type: T.Type) throws -> T
    func removeDraft<T: Draftable>(with id: UUID, of type: T.Type) throws
    func buildFolderInsideDraftFolder<T: Draftable>(with name: String, of type: T.Type) throws -> URL

    func save<T: Draftable>(_ draft: T, with type: T.Type, and userID: Int) throws
    func getAllDrafts<T: Draftable>(with type: T.Type, and userID: Int) throws -> [T]
    func getDraft<T: Draftable>(with id: UUID, of type: T.Type, and userID: Int) throws -> T
    func removeDraft<T: Draftable>(with id: UUID, of type: T.Type, and userID: Int) throws
    func buildFolderInsideDraftFolder<T: Draftable>(with name: String, of type: T.Type, and userID: Int) throws -> URL
}
