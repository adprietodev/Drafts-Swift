//
//  CarsContainer.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class CarsContainer {
    static func makeUseCase() -> CarsUseCase {
        let draftManager = FileSystemDraftManagerContainer.build()
        let localDataSource = LocalCarDataSource(draftManager: draftManager)
        let repository = CarsRepository(localDataSource: localDataSource)
        return CarsUseCase(repository: repository)
    }
}
