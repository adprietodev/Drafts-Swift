//
//  ProductBuilder.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductBuilder {
    static func build() -> ProductsView {
        let productsWithImagesUseCase = ProductsWithImagesContainer.makeUseCase()
        let viewModel = ProductsViewModel(productWithImagesUseCase: productsWithImagesUseCase)
        return ProductsView(viewModel: viewModel)
    }
}
