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
    private let fileManager: FileManager

    // MARK: - Init
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    // MARK: - Functions
    func save<T: Draftable>(_ draft: T, with type: T.Type) throws {
        var drafts = try getAllDrafts(with: type)

        if drafts.contains(where: { $0.id == draft.id }) {
            print("⚙️ 📄 Updating draft review ")
            try update(draft: draft, at: &drafts, with: type)
        } else {
            print("⚙️ 📄 Adding draft review ")
            try add(draft: draft, at: &drafts, with: type)
        }
    }

    func getAllDrafts<T: Draftable>(with type: T.Type) throws -> [T] {
        let fileURL = try buildDraftFileURL(with: type)

        if !fileManager.fileExists(atPath: fileURL.path) {
            return []
        }

        guard let data = try? Data(contentsOf: fileURL) else {
            throw LocalError.failureLoad
        }

        do {
            let drafts = try JSONDecoder().decode([T].self, from: data)
            return drafts.reversed()
        } catch {
            print("❌ 📄 Failure to get drafts \(String(describing: T.self))")
            print("❌ ❌ Error: \(error)")
            throw LocalError.failureDecode
        }
    }

    func getDraft<T: Draftable>(with id: UUID, with type: T.Type) throws -> T {
        let drafts = try getAllDrafts(with: type)
        guard let draft = drafts.first(where: { $0.id == id }) else {
            throw LocalError.failureLoad
        }
        return draft
    }

    func removeDraft<T: Draftable>(with id: UUID, with type: T.Type) throws {
        var drafts = try getAllDrafts(with: type)
        guard let index = drafts.firstIndex(where: { $0.id == id }) else {
            print("❌ 📄 Failure draft not found with id: \(id)")
            throw LocalError.notFoundUUID
        }

        drafts.remove(at: index)
        print("✅ 📄 Removed succesfull draft \(type)")
        try updateAll(drafts, with: type)
    }

    func buildFolderInsideDraftFolder<T: Draftable>(with name: String, with type: T.Type) throws -> URL {
        let draftFolder = try buildDraftFolderURLInDocuments(with: type)
        let newFolder = draftFolder.appendingPathComponent(name)

        if !fileManager.fileExists(atPath: newFolder.path) {
            try createFolder(newFolder)
        }

        return newFolder
    }
}

// MARK: - Private extension
private extension FileSystemDraftsManager {
    func update<T: Draftable>(draft: T, at drafts: inout [T], with type: T.Type) throws {
        try removeDraft(with: draft.id, with: type)
        drafts.append(draft)
        try updateAll(drafts, with: type)
        print("✅ 📄 Update succesfull draft \(type)")
    }

    func add<T: Draftable>(draft: T, at drafts: inout [T], with type: T.Type) throws {
        drafts.append(draft)
        try updateAll(drafts, with: type)
        print("✅ 📄 Add succesfull draft \(type)")
    }

    func createFolder(_ folder: URL) throws {
        do {
            try fileManager.createDirectory(at: folder, withIntermediateDirectories: true)
        } catch {
            throw LocalError.errorCreateFolder
        }
    }

    func buildDraftFolderURLInDocuments<T: Draftable>(with type: T.Type) throws -> URL {
        let draftFolder = try buildDraftFolder(with: String(describing: T.self))

        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw LocalError.draftFolder
        }

        let draftFolderURL = documents.appendingPathComponent(draftFolder)

        if !fileManager.fileExists(atPath: draftFolderURL.path) {
            try createFolder(draftFolderURL)
        }

        return draftFolderURL
    }

    func buildDraftFolder(with draftName: String) throws -> String {
        guard let bundle = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") else {
            return ""
        }
        return "\(bundle)/Drafts_\(draftName)"
    }

    func updateAll<T: Draftable>(_ drafts: [T], with type: T.Type) throws {
        let fileURL = try buildDraftFileURL(with: type)

        guard !drafts.isEmpty else {
            do {
                try removeDraftFile(fileURL)
                print("✅ 📄 Remove succesfull drafts file")
                return
            } catch {
                print("❌ 📄 Failure remove drafts file")
                throw LocalError.failureRemoveFolder
            }
        }

        guard let data = try? JSONEncoder().encode(drafts) else {
            throw LocalError.failureEncode
        }

        do {
            try data.write(to: fileURL, options: .atomic)
            print("✅ 📄 Update succesfull drafts \(type)")
        } catch {
            print("❌ 📄 Failure save drafts")
            print("❌ ❌ Error: \(error)")
            throw LocalError.failureSave
        }
    }

    func removeDraftFile(_ file: URL) throws {
        try fileManager.removeItem(at: file)
    }

    func buildDraftFileURL<T: Draftable>(with type: T.Type) throws -> URL {
        let draftFilename = "drafts.json"
        let draftFolder = try buildDraftFolderURLInDocuments(with: type)
        return draftFolder.appendingPathComponent(draftFilename)
    }
}
