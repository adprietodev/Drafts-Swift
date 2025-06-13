//
//  FileSystemDraftsManager.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class FileSystemDraftsManager: FileSystemDraftsManagerProtocol {
    // MARK: - Properties
    private let fileSystemService: FileSystemServiceProtocol
    private let jsonService: JSONServiceProtocol
    private let pathBuilder: PathBuilderProtocol

    // MARK: - Init
    init(
        fileSystemService: FileSystemServiceProtocol,
        jsonService: JSONServiceProtocol,
        pathBuilder: PathBuilderProtocol
    ) {
        self.fileSystemService = fileSystemService
        self.jsonService = jsonService
        self.pathBuilder = pathBuilder
    }

    // MARK: - Functions
    func createFolderInsideDraftFolder<T: Draftable>(name: String, of type: T.Type, userID: Int? = nil) throws -> URL {
        let context = DraftContext(userID: userID)
        let draftFolder = try pathBuilder.buildDraftFolderURL(for: type, context: context)
        let newFolder = draftFolder.appendingPathComponent(name)

        if !fileSystemService.fileExists(at: newFolder) {
            try fileSystemService.createDirectory(at: newFolder)
        }

        return newFolder
    }
}

// MARK: - DraftManagerProtocol
extension FileSystemDraftsManager {
    func save<T: Draftable>(_ draft: T) throws {
        try perfomSave(draft, context: .init())
    }

    func getAll<T: Draftable>(of type: T.Type) throws -> [T] {
        try performGetAll(of: type, context: .init())
    }

    func get<T: Draftable>(id: UUID, of type: T.Type) throws -> T {
        try performGet(id: id, of: type, context: .init())
    }

    func remove<T: Draftable>(id: UUID, of type: T.Type) throws {
        try performRemove(id: id, of: type, context: .init())
    }
}

// MARK: - UserDraftManagerProtocol
extension FileSystemDraftsManager {
    func save<T: Draftable>(_ draft: T, userID: Int) throws {
        try perfomSave(draft, context: .init(userID: userID))
    }

    func getAll<T: Draftable>(of type: T.Type, userID: Int) throws -> [T] {
        try performGetAll(of: type, context: .init(userID: userID))
    }

    func get<T: Draftable>(id: UUID, of type: T.Type, userID: Int) throws -> T {
        try performGet(id: id, of: type, context: .init(userID: userID))
    }

    func remove<T: Draftable>(id: UUID, of type: T.Type, userID: Int) throws {
        try performRemove(id: id, of: type, context: .init(userID: userID))
    }
}

// MARK: - Private functions
private extension FileSystemDraftsManager {
    func perfomSave<T: Draftable>(_ draft: T, context: DraftContext) throws {
        var drafts = try performGetAll(of: T.self, context: context)

        if let existingIndex = drafts.firstIndex(where: { $0.id == draft.id }) {
            DraftLogger.info("Updating draft")
            drafts[existingIndex] = draft
        } else {
            DraftLogger.info("Adding new draft")
            drafts.append(draft)
        }

        try saveDrafts(drafts, context: context)
        DraftLogger.success("Draft saved successfully")
    }

    func performGetAll<T: Draftable>(of type: T.Type, context: DraftContext) throws -> [T] {
        let fileURL = try pathBuilder.buildDraftFileURL(for: type, context: context)

        guard fileSystemService.fileExists(at: fileURL) else {
            return []
        }

        guard let data = try? Data(contentsOf: fileURL) else {
            throw DraftError.failureLoad
        }

        let drafts = try jsonService.decode([T].self, from: data)
        return drafts.reversed()
    }

    func performGet<T: Draftable>(id: UUID, of type: T.Type, context: DraftContext) throws -> T {
        let drafts = try performGetAll(of: type, context: context)

        guard let draft = drafts.first(where: { $0.id == id}) else {
            throw DraftError.notFoundUUID
        }

        return draft
    }

    func performRemove<T: Draftable>(id: UUID, of type: T.Type, context: DraftContext) throws {
        var drafts = try performGetAll(of: type, context: context)

        guard let index = drafts.firstIndex(where: { $0.id == id }) else {
            DraftLogger.error("Draft not found with id: \(id)")
            throw DraftError.notFoundUUID
        }

        drafts.remove(at: index)
        try saveDrafts(drafts, context: context)
        DraftLogger.success("Draft removed successfully")
    }

    func saveDrafts<T: Draftable>(_ drafts: [T], context: DraftContext) throws {
        let fileURL = try pathBuilder.buildDraftFileURL(for: T.self, context: context)

        guard !drafts.isEmpty else {
            try clearEmptyDraftFile(at: fileURL)
            return
        }

        let data = try jsonService.encode(drafts)

        do {
            try data.write(to: fileURL, options: .atomic)
        } catch {
            DraftLogger.error("Failed to save drafts: \(error.localizedDescription)")
            throw DraftError.failureSave
        }
    }

    func clearEmptyDraftFile(at fileURL: URL) throws {
            if fileSystemService.fileExists(at: fileURL) {
                try fileSystemService.removeItem(at: fileURL)
                DraftLogger.success("Empty draft file removed")
            }
        }
}
