//
//  ProductsUseCaseProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol ProductsUseCaseProtocol {
    func getDrafts() throws -> [Product]
    func save(_ product: Product) throws
    func remove(_ product: Product) throws
    func buildImageFolder(with name: String) throws -> URL

    func getDrafts(by userID: Int) throws -> [Product]
    func save(_ product: Product, by userID: Int) throws
    func remove(_ product: Product, by userID: Int) throws
    func buildImageFolder(with name: String, by userID: Int) throws -> URL 
}
