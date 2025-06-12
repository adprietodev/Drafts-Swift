//
//  FileSystemDraftManagerContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class FileSystemDraftManagerContainer {
    static func build() -> FileSystemDraftsManager {
        let fileSystemService = FileSystemService()
        let jsonService = JSONService()
        let pathBuilder = PathBuilder(fileSystemService: fileSystemService)
        return FileSystemDraftsManager(fileSystemService: fileSystemService, jsonService: jsonService, pathBuilder: pathBuilder)
    }
}
