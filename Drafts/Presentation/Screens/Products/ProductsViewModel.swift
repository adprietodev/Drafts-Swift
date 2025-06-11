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
    private let productWithImagesUseCase: ProductsWithImagesUseCaseProtocol
    @Published var drafts = [Product]()
    @Published var product: Product
    @Published var isByUser = false

    // MARK: - Init
    init(productWithImagesUseCase: ProductsWithImagesUseCaseProtocol) {
        self.productWithImagesUseCase = productWithImagesUseCase
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
            isByUser ? try productWithImagesUseCase.save(&product, by: 1) : try productWithImagesUseCase.save(&product)
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }

    @MainActor
    func getDrafts() {
        do {
            drafts = isByUser ? try productWithImagesUseCase.getDrafts(by: 1) : try productWithImagesUseCase.getDrafts()
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }

    @MainActor
    func removeDraft(at product: Product) {
        do {
            isByUser ? try productWithImagesUseCase.remove(product, by: 1) : try productWithImagesUseCase.remove(product)

            guard let index = drafts.firstIndex(where: { $0.draftID == product.draftID}) else { return }
            drafts.remove(at: index)
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }
}
