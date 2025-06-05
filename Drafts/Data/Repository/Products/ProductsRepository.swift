//
//  ProductsRepository.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductsRepository: ProductsRepositoryProtocol {
    // MARK: - Properties
    private let localDataSource: LocalProductsDataSourceProtocol

    // MARK: - Init
    init(localDataSource: LocalProductsDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    // MARK: - Functions
    func getDrafts() throws -> [Product] {
        let productsDTO = try localDataSource.getDrafts()
        return productsDTO.map { $0.toDomain() }
    }

    func save(_ product: Product) throws {
        try localDataSource.save(product.toDTO())
    }

    func remove(_ product: Product) throws {
        try localDataSource.remove(product.toDTO())
    }

    func buildImageFolder(with name: String) throws -> URL {
        try localDataSource.buildImageFolder(with: name)
    }
}

// MARK: - Mappers
fileprivate extension LocalProductDTO {
    func toDomain() -> Product {
        Product(draftID: self.id,
                name: self.name,
                description: self.description,
                price: self.price,
                category: self.category,
                brand: self.brand,
                imagePath: self.imagePath,
                isAvailable: self.isAvailable,
                stockQuantity: self.stockQuantity)
    }
}

fileprivate extension Product {
    func toDTO() -> LocalProductDTO {
        LocalProductDTO(id: self.draftID,
                        name: self.name,
                        description: self.description,
                        price: self.price,
                        category: self.category,
                        brand: self.brand,
                        imagePath: self.imagePath ?? "",
                        isAvailable: self.isAvailable,
                        stockQuantity: self.stockQuantity)
    }
}
