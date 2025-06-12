//
//  CarViewModel.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class CarViewModel: ObservableObject {
    // MARK: - Properties
    private let carUseCases: CarsUseCaseProtocol
    @Published var drafts = [Car]()
    @Published var draft: Car?

    // MARK: - Init
    init(carUseCases: CarsUseCaseProtocol) {
        self.carUseCases = carUseCases
    }

    // MARK: - Functions
    @MainActor
    func getDrafts() {
        Task {
            do {
                drafts = try carUseCases.getAllDrafts()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    @MainActor
    func getDraft(with id: UUID) {
        Task {
            do {
                draft = try carUseCases.getDraft(with: id)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func saveRandomDraft() {
        Task {
            do {
                try carUseCases.saveDraft(.randomMock())
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    @MainActor
    func removeDraft(with id: UUID) {
        Task {
            do {
                try carUseCases.removeDraft(with: id)
                getDrafts()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
