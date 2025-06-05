//
//  ImageUseCase.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ImageUseCase: ImageUseCaseProtocol {
    // MARK: - Properties
    private let repository: ImageRepositoryProtocol

    // MARK: - Init
    init(repository: ImageRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Function
    func buildImagePath(_ image: Data?, in folderURL: URL, with name: String, imageExtension: Constants.Image.Extension = .jpg) throws -> String {
        try repository.buildImagePath(image, in: folderURL, with: name, imageExtension: imageExtension)
    }

    func loadImage(with path: String?) throws -> Data? {
        try repository.loadImage(with: path)
    }

    func removeImage(with path: String) throws {
        try repository.removeImage(with: path)
    }

    func removeImageFolder(_ folder: URL) throws {
        try repository.removeImageFolder(folder)
    }
}
