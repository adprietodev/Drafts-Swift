//
//  CarsRepository.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class CarsRepository: CarsRepositoryProtocol {
    // MARK: - Properties
    private let localDataSource: LocalCarDataSourceProtocol

    // MARK: - Init
    init(localDataSource: LocalCarDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    // MARK: - Functions
    func saveDraft(_ car: Car) throws {
        let localCarDTO = car.toLocalDTO()
        try localDataSource.saveDraft(localCarDTO)
    }

    func getAllDrafts() throws -> [Car] {
        try localDataSource.getAllDrafts().map { $0.toDomain() }
    }

    func getDraft(with id: UUID) throws -> Car {
        try localDataSource.getDraft(with: id).toDomain()
    }

    func removeDraft(with id: UUID) throws {
        try localDataSource.removeDraft(with: id)
    }
}

// MARK: - Mappers
fileprivate extension Car {
    func toLocalDTO() -> LocalCarDTO {
        LocalCarDTO(id: self.draftID,
                    make: self.make,
                    model: self.model,
                    year: self.year,
                    isElectric: self.isElectric)
    }
}

fileprivate extension LocalCarDTO {
    func toDomain() -> Car {
        Car(draftID: self.id,
            make: self.make,
            model: self.model,
            year: self.year,
            isElectric: self.isElectric)
    }
}
