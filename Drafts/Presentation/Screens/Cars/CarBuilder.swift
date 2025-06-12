//
//  CarBuilder.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class CarBuilder {
    func build() -> CarView {
        let carUseCase = CarsContainer.makeUseCase()
        let viewModel = CarViewModel(carUseCases: carUseCase)
        return CarView(viewModel: viewModel)
    }
}
