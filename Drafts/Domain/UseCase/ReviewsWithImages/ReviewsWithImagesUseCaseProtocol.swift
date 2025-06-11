//
//  ReviewsWithImagesUseCaseProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 11/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol ReviewsWithImagesUseCaseProtocol {
    func getDrafts() throws -> [Review]
    func save(_ review: inout Review) throws
    func remove(_ review: Review) throws
}
