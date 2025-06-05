//
//  ProductsRepositoryProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol ProductsRepositoryProtocol {
    func getDrafts() throws -> [Product]
    func save(_ product: Product) throws
    func remove(_ product: Product) throws
    func buildImageFolder(with name: String) throws -> URL
}
