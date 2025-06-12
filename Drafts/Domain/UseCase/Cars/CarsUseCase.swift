//
//  CarsUseCase.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class CarsUseCase: CarsUseCaseProtocol {
    // MARK: - Properties
    private let repository: CarsRepositoryProtocol

    // MARK: - Init
    init(repository: CarsRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Functions
    func saveDraft(_ car: Car) throws {
        try repository.saveDraft(car)
    }

    func getAllDrafts() throws -> [Car] {
        try repository.getAllDrafts()
    }

    func getDraft(with id: UUID) throws -> Car {
        try repository.getDraft(with: id)
    }

    func removeDraft(with id: UUID) throws {
        try repository.removeDraft(with: id)
    }
}
