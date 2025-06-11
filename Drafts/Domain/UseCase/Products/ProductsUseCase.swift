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
    
    // MARK: - Init
    init(repository: ProductsRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Functions
    func getDrafts() throws -> [Product] {
        try repository.getDrafts()
    }
    
    func save(_ product: Product) throws {
        try repository.save(product)
    }
    
    func remove(_ product: Product) throws {
        try repository.remove(product)
    }
    
    func buildImageFolder(with name: String) throws -> URL {
        try repository.buildImageFolder(with: name)
    }
    
    func getDrafts(by userID: Int) throws -> [Product] {
        try repository.getDrafts(by: userID)
    }
    
    func save(_ product: Product, by userID: Int) throws {
        try repository.save(product, at: userID)
    }
    
    func remove(_ product: Product, by userID: Int) throws {
        try repository.remove(product, at: userID)
    }
    
    func buildImageFolder(with name: String, by userID: Int) throws -> URL {
        try repository.buildImageFolder(with: name, at: userID)
    }
}
