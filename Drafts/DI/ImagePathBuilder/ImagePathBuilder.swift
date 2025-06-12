//
//  ImagePathBuilder.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ImagePathBuilder: ImagePathBuilderProtocol {
    // MARK: - Properties
    private let fileSystemService: FileSystemServiceProtocol

    // MARK: - Init
    init(fileSystemService: FileSystemServiceProtocol) {
        self.fileSystemService = fileSystemService
    }

    // MARK: - Functions
    func buildImagePath(folderURL: URL, name: String, extensionImage: Constants.Image.Extension) -> URL {
        return folderURL.appendingPathComponent("\(name).\(extensionImage.rawValue)")
    }
    
    func buildRelativePath(from absoluteURL: URL) -> String {
        do {
            let documentsURL = try fileSystemService.documentsDirectory()
            let relativePath = absoluteURL.path.replacingOccurrences(of: documentsURL.path+"/", with: "")
            ImageLogger.info("Relative path created: \(relativePath)")
            return relativePath
        } catch {
            ImageLogger.error("Failed to build relative path: \(error)")
            return ""
        }
    }
    
    func buildAbsolutePath(from relativePath: String) -> URL {
        do {
            let documentsURL = try fileSystemService.documentsDirectory()
            return documentsURL.appendingPathComponent(relativePath)
        } catch {
            ImageLogger.error("Failed to build absolute path: \(error)")
            return URL(fileURLWithPath: "")
        }
    }
}
