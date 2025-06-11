//
//  ProductsViewModel.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ProductsViewModel: ObservableObject {
    // MARK: - Properties
    private let productUseCase: ProductsUseCaseProtocol
    @Published var drafts = [Product]()
    @Published var product: Product
    @Published var isByUser = false

    // MARK: - Init
    init(productUseCase: ProductsUseCaseProtocol) {
        self.productUseCase = productUseCase
        self.product = .randomMockProduct()
    }

    // MARK: - Functions
    @MainActor
    func onAppear() {
        getDrafts()

    }

    @MainActor
    func getProduct() {
        product = .randomMockProduct()
    }

    func saveDraft() {
        do {
            isByUser ? try productUseCase.save(&product, by: 1) : try productUseCase.save(&product)
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }

    @MainActor
    func getDrafts() {
        do {
            drafts = isByUser ? try productUseCase.getDrafts(by: 1) : try productUseCase.getDrafts()
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }

    @MainActor
    func removeDraft(at product: Product) {
        do {
            isByUser ? try productUseCase.remove(product, by: 1) : try productUseCase.remove(product)

            guard let index = drafts.firstIndex(where: { $0.draftID == product.draftID}) else { return }
            drafts.remove(at: index)
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }
}
