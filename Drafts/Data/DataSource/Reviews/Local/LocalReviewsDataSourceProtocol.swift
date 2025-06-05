//
//  LocalReviewDataSourceProtocol.swift
//  Drafts
//
//  Created by Adrian Prieto Villena on 4/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol LocalReviewsDataSourceProtocol {
    func getDrafts() throws -> [LocalReviewDTO]
    func save(_ review: LocalReviewDTO) throws
    func remove(with id: UUID) throws
    func buildImageFolder(with name: String) throws -> URL
}
