//
//  ReviewUseCaseProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol ReviewUseCaseProtocol {
    func getDrafts() throws -> [Review]
    func save(_ review: Review) throws
    func remove(_ review: Review) throws
    func buildImageFolder(with name: String) throws -> URL
}
