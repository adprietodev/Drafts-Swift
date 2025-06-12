//
//  CarMocks.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

extension Car {
    static func createMock() -> [Car] {
        return [
            Car(make: "Toyota", model: "Corolla", year: 2020, isElectric: false),
            Car(make: "Tesla", model: "Model 3", year: 2023, isElectric: true),
            Car(make: "Ford", model: "Mustang", year: 2018, isElectric: false),
            Car(make: "Nissan", model: "Leaf", year: 2021, isElectric: true),
            Car(make: "Chevrolet", model: "Bolt", year: 2022, isElectric: true)
        ]
    }

    static func randomMock() -> Car {
        return createMock().randomElement() ?? createMock().first!
    }
}
