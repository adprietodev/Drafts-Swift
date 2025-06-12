//
//  FileSystemService.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class FileSystemService: FileSystemServiceProtocol {
    // MARK: - Properties
    private let fileManager: FileManager

    // MARK: - Init
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    // MARK: - Functions
    func fileExists(at url: URL) -> Bool {
        return fileManager.fileExists(atPath: url.path)
    }
    
    func createDirectory(at url: URL) throws {
        do {
            try fileManager.createDirectory(at: url, withIntermediateDirectories: true)
        } catch {
            throw DraftError.failureCreateFolder
        }
    }
    
    func removeItem(at url: URL) throws {
        do {
            try fileManager.removeItem(at: url)
        } catch {
            throw DraftError.failureRemoveFile
        }
    }
    
    func documentsDirectory() throws -> URL {
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw DraftError.draftFolder
        }
        return documents
    }
}
