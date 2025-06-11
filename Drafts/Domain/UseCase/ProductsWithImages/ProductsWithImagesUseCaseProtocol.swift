//
//  ProductsWithImagesUseCaseProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 11/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol ProductsWithImagesUseCaseProtocol {
    func getDrafts() throws -> [Product]
    func save(_ product: inout Product) throws
    func remove(_ product: Product) throws

    func getDrafts(by userID: Int) throws -> [Product]
    func save(_ product: inout Product, by userID: Int) throws
    func remove(_ product: Product, by userID: Int) throws
}
