//
//  ProductsUseCase.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductsUseCase: ProductsUseCaseProtocol {
    // MARK: - Properties
    private let repository: ProductsRepositoryProtocol
    private let imageUseCase: ImageUseCaseProtocol

    // MARK: - Init
    init(repository: ProductsRepositoryProtocol, imageUseCase: ImageUseCaseProtocol) {
        self.repository = repository
        self.imageUseCase = imageUseCase
    }

    // MARK: - Functions
    func getDrafts() throws -> [Product] {
        var products = try repository.getDrafts()

        try products.enumerated().forEach { index, product in
            products[index].imageData = try imageUseCase.loadImage(with: product.imagePath)
        }

        return products
    }

    func save(_ product: inout Product) throws {
        let imageFolder = try repository.buildImageFolder(with: "\(Constants.Image.folderName)\(product.draftID)")
        let imagePath = try imageUseCase.buildImagePath(product.imageData, in: imageFolder, with: "product", imageExtension: .jpg)

        product.imagePath = imagePath

        try repository.save(product)
    }

    func remove(_ product: Product) throws {
        if let imagePath = product.imagePath {
            try imageUseCase.removeImage(with: imagePath)
        }

        try repository.remove(product)
    }
}
