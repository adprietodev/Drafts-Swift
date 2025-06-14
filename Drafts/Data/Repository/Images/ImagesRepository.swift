//
//  ImagesRepository.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ImagesRepository: ImageRepositoryProtocol {
    // MARK: - Properties
    private let localDataSource: LocalImagesDataSourceProtocol

    // MARK: - Init
    init(localDataSource: LocalImagesDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    // MARK: - Functions
    func buildImagePath(_ image: Data?, in folderURL: URL, with name: String, extensionImage: Constants.Image.Extension) throws -> String {
        try localDataSource.buildImagePath(image, in: folderURL, with: name, extensionImage: extensionImage)
    }

    func loadImage(with path: String?) throws -> Data? {
        try localDataSource.load(from: path)
    }

    func removeImage(with path: String) throws {
        try localDataSource.remove(at: path)
    }

    func removeImageFolder(_ folder: URL) throws {
        try localDataSource.removeFolder(at: folder)
    }
}
