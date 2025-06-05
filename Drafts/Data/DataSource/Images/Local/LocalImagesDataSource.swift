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
    private let fileManager: FileManager
    private let documentsURL: URL

    // MARK: - Init
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        self.documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    // MARK: - Functions
    func buildImagePath(_ image: Data?, in folderURL: URL, with name: String, imageExtension: Constants.Image.Extension) throws -> String {
        let fileURL = folderURL.appendingPathComponent("\(name).\(imageExtension.rawValue)")

        guard let image else {
            print("👀 🌁 Empty image")
            return ""
        }

        do {
            try save(image: image, in: fileURL)
            print("⚙️ ✅ Image saved")

            return builRelativePath(at: fileURL)
        } catch {
            print("❌ 🌁 Failure to save image")
            throw LocalError.cantWrite
        }
    }

    func loadImage(with path: String?) throws -> Data? {
        guard let path, !path.isEmpty else { return nil }

        let imageFilePath = buildAbsolutePath(path)

        do {
            return try Data(contentsOf: imageFilePath)
        } catch {
            print("❌ ❌  Error: \(error.localizedDescription)")
            throw LocalError.parseData
        }
    }

    func removeImage(with path: String?) throws {
        guard let path, !path.isEmpty else {
            print("⚙️ ❌  No image to remove")
            return
        }

        let imageFilePath = buildAbsolutePath(path)

        do {
            print("⚙️ 🧬 Removing image...")
            try fileManager.removeItem(at: imageFilePath)
            print("✅ 🌁 Image successfully removed")
        } catch {
            print("❌ ❌  Error: \(error.localizedDescription)")
            throw LocalError.failureRemoveImage
        }
    }

    func removeImageFolder(_ folder: URL) throws {
        do {
            if fileManager.fileExists(atPath: folder.path) {
                try fileManager.removeItem(at: folder)
                print("✅ Folder removed successfully")
            } else {
                print("⚠️ Folder not found.")
            }
        } catch {
            print("❌ Failure remove folder: \(error.localizedDescription)")
            throw LocalError.failureRemoveFolder
        }
    }
}

// MARK: - Private extension
private extension LocalImagesDataSource {
    func save(image: Data, in file: URL) throws {
        print("⚙️ 🧬 Saving image...")
        try image.write(to: file)
    }

    func builRelativePath(at file: URL) -> String {
        let relativePath = file.path.replacingOccurrences(of: documentsURL.path + "/", with: "")
        print("⚙️ 📁 Relative path saved: \(relativePath)")
        return relativePath
    }

    func buildAbsolutePath(_ path: String) -> URL {
        return documentsURL.appendingPathComponent(path)
    }
}
