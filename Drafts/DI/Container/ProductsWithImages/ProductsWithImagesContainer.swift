//
//  ProductsWithImagesContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 11/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductsWithImagesContainer {
    static func makeUseCase() -> ProductsWithImagesUseCase {
        let productUseCase = ProductsContainer().makeUseCase()
        let imagesUseCase = ImagesContainer().makeUseCase()
        return ProductsWithImagesUseCase(productUseCase: productUseCase, imagesUseCase: imagesUseCase)
    }
}
