//
//  ProductsContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductsContainer {
    func makeUseCase() -> ProductsUseCase {
        let localDataSource = LocalProductsDataSource(draftManager: FileSystemDraftsManager())
        let repository = ProductsRepository(localDataSource: localDataSource)
        return ProductsUseCase(repository: repository)
    }
}
