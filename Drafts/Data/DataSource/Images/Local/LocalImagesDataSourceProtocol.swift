//
//  LocalImagesDataSourceProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol LocalImagesDataSourceProtocol: ImageStorageProtocol, ImageFolderManagerProtocol {
}

protocol ImageStorageProtocol {
    func buildImagePath(_ imageData: Data?, in folderURL: URL, with name: String, extensionImage: Constants.Image.Extension) throws -> String
    func load(from path: String?) throws -> Data?
    func remove(at path: String?) throws
}

protocol ImageFolderManagerProtocol {
    func removeFolder(at path: URL) throws
}
