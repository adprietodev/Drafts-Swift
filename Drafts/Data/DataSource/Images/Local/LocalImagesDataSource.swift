//
//  LocalImagesDataSource.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class LocalImagesDataSource: LocalImagesDataSourceProtocol {
    // MARK: - Properties
    private let fileSystemService: FileSystemServiceProtocol
    private let pathBuilder: ImagePathBuilderProtocol

    // MARK: - Init
    init(fileSystemService: FileSystemServiceProtocol, pathBuilder: ImagePathBuilderProtocol) {
        self.fileSystemService = fileSystemService
        self.pathBuilder = pathBuilder
    }

    // MARK: - Functions
    func buildImagePath(_ imageData: Data?, in folderURL: URL, with name: String, extensionImage: Constants.Image.Extension) throws -> String {
        guard let imageData = imageData else {
            ImageLogger.info("Empty image data")
            return ""
        }

        return try save(imageData, to: folderURL, name: name, extensionImage: extensionImage)
    }

    func load(from path: String?) throws -> Data? {
        guard let path = validatePath(path) else {
            return nil
        }

        let absolutePath = pathBuilder.buildAbsolutePath(from: path)

        do {
            let imageData = try Data(contentsOf: absolutePath)
            return imageData
        } catch {
            ImageLogger.error("Failed to load image: \(error.localizedDescription)")
            throw ImageError.parseData
        }
    }

    func remove(at path: String?) throws {
        guard let path = validatePath(path) else {
            ImageLogger.info("No image path provide for removal")
            return
        }

        let absolutePath = pathBuilder.buildAbsolutePath(from: path)

        do {
            ImageLogger.info("Removing image...")
            try fileSystemService.removeItem(at: absolutePath)
            ImageLogger.success("Image removed successfully")
        } catch {
            ImageLogger.error("Failed to remove image: \(error.localizedDescription)")
            throw ImageError.failureRemoveImage
        }
    }

    func removeFolder(at path: URL) throws {
        guard fileSystemService.fileExists(at: path) else {
            ImageLogger.warning("Folder not found at: \(path.path)")
            throw ImageError.folderNotFound
        }

        do {
            try fileSystemService.removeItem(at: path)
            ImageLogger.success("Folder removed successfully")
        } catch {
            ImageLogger.error("Failed to remove folder: \(error.localizedDescription)")
            throw ImageError.failureRemoveFolder
        }
    }
}

// MARK: - Private functions
private extension LocalImagesDataSource {
    func save(_ imageData: Data, to folderURL: URL, name: String, extensionImage: Constants.Image.Extension) throws -> String {
        guard !imageData.isEmpty else {
            ImageLogger.info("Empty image data provider")
            throw ImageError.emptyImageData
        }

        let fileURL = pathBuilder.buildImagePath(folderURL: folderURL, name: name, extensionImage: extensionImage)

        do {
            ImageLogger.info("Saving image to: \(fileURL.path)")
            try imageData.write(to: fileURL)

            let relativePath = pathBuilder.buildRelativePath(from: fileURL)
            ImageLogger.success("Image saved succesfully")

            return relativePath
        } catch {
            ImageLogger.error("Failed to save image: \(error.localizedDescription)")
            throw ImageError.cantWrite
        }
    }

    func validatePath(_ path: String?) -> String? {
        guard let path = path, !path.isEmpty else {
            return nil
        }
        return path
    }
}
