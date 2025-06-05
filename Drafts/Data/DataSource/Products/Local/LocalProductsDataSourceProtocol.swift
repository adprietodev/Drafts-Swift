//
//  LocalProductsDataSource.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol LocalProductsDataSourceProtocol {
    func getDrafts() throws -> [LocalProductDTO]
    func save(_ product: LocalProductDTO) throws
    func remove(_ product: LocalProductDTO) throws
    func buildImageFolder(with name: String) throws -> URL
}
