//
//  DraftLocalManagerProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol FileSystemDraftsManagerProtocol: DraftManagerProtocol, UserDraftManagerProtocol {
}

protocol DraftManagerProtocol: FolderManagerProtocol {
    func save<T: Draftable>(_ draft: T) throws
    func getAll<T: Draftable>(of type: T.Type) throws -> [T]
    func get<T: Draftable>(id: UUID, of type: T.Type) throws -> T
    func remove<T: Draftable>(id: UUID, of type: T.Type) throws
}

protocol UserDraftManagerProtocol: FolderManagerProtocol {
    func save<T: Draftable>(_ draft: T, userID: Int) throws
    func getAll<T: Draftable>(of type: T.Type, userID: Int) throws -> [T]
    func get<T: Draftable>(id: UUID, of type: T.Type, userID: Int) throws -> T
    func remove<T: Draftable>(id: UUID, of type: T.Type, userID: Int) throws
}

protocol FolderManagerProtocol {
    func createFolderInsideDraftFolder<T: Draftable>(name: String, of type: T.Type, userID: Int?) throws -> URL
}
