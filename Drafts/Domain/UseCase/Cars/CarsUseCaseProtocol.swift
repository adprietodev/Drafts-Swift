//
//  CarsUseCaseProtocol.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

protocol CarsUseCaseProtocol {
    func saveDraft(_ car: Car) throws
    func getAllDrafts() throws -> [Car]
    func getDraft(with id: UUID) throws -> Car
    func removeDraft(with id: UUID) throws
}
