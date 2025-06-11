//
//  ProductsWithImagesUseCase.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 11/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductsWithImagesUseCase: ProductsWithImagesUseCaseProtocol {
    // MARK: - Properties
    private let productUseCase: ProductsUseCaseProtocol
    private let imagesUseCase: ImageUseCaseProtocol

    // MARK: - Init
    init(productUseCase: ProductsUseCaseProtocol, imagesUseCase: ImageUseCaseProtocol) {
        self.productUseCase = productUseCase
        self.imagesUseCase = imagesUseCase
    }

    // MARK: - Functions
    func getDrafts() throws -> [Product] {
        var products = try productUseCase.getDrafts()

        try products.enumerated().forEach { index, product in
            products[index].imageData = try imagesUseCase.loadImage(with: product.imagePath)
        }

        return products
    }

    func save(_ product: inout Product) throws {
        let imageFolder = try productUseCase.buildImageFolder(with: "\(Constants.Image.folderName)\(product.draftID)")
        let imagePath = try imagesUseCase.buildImagePath(product.imageData, in: imageFolder, with: "product", imageExtension: .jpg)

        product.imagePath = imagePath

        try productUseCase.save(product)
    }

    func remove(_ product: Product) throws {
        if let imagePath = product.imagePath {
            try imagesUseCase.removeImage(with: imagePath)
        }

        try productUseCase.remove(product)
    }

    func getDrafts(by userID: Int) throws -> [Product] {
        var products = try productUseCase.getDrafts(by: userID)

        try products.enumerated().forEach { index, product in
            products[index].imageData = try imagesUseCase.loadImage(with: product.imagePath)
        }

        return products
    }

    func save(_ product: inout Product, by userID: Int) throws {
        let imageFolder = try productUseCase.buildImageFolder(with: "\(Constants.Image.folderName)\(product.draftID)", by: userID)
        let imagePath = try imagesUseCase.buildImagePath(product.imageData, in: imageFolder, with: "product", imageExtension: .jpg)

        product.imagePath = imagePath

        try productUseCase.save(product, by: userID)
    }

    func remove(_ product: Product, by userID: Int) throws {
        if let imagePath = product.imagePath {
            try imagesUseCase.removeImage(with: imagePath)
        }

        try productUseCase.remove(product, by: userID)
    }
}
