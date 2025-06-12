//
//  PathBuilder.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class PathBuilder: PathBuilderProtocol {
    // MARK: - Properties
    private let fileSystemService: FileSystemServiceProtocol

    // MARK: - Init
    init(fileSystemService: FileSystemServiceProtocol) {
        self.fileSystemService = fileSystemService
    }

    // MARK: - Functions
    func buildDraftFileURL<T>(for type: T.Type, context: DraftContext) throws -> URL where T : Draftable {
        let folderURL = try buildDraftFolderURL(for: type, context: context)
        return folderURL.appendingPathComponent("drafts.json")
    }
    
    func buildDraftFolderURL<T>(for type: T.Type, context: DraftContext) throws -> URL where T : Draftable {
        let documentsURL = try fileSystemService.documentsDirectory()
        let folderPath = buildFolderPath(for: type, context: context)
        let folderURL = documentsURL.appendingPathComponent(folderPath)

        if !fileSystemService.fileExists(at: folderURL) {
            try fileSystemService.createDirectory(at: folderURL)
        }

        return folderURL
    }
}

// MARK: - Private functions
private extension PathBuilder {
    func buildFolderPath<T: Draftable>(for type: T.Type, context: DraftContext) -> String {
            guard let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String else {
                return "UnknownApp"
            }

            let typeName = String(describing: type)
            let basePath = "\(bundleName)/Drafts_\(typeName)"

            if let userID = context.userID {
                return "\(basePath)/User_\(userID)"
            }

            return basePath
        }
}
