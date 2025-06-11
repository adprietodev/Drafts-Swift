//
//  ProductsViewModel.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

class ReviewsViewModel: ObservableObject {
    // MARK: - Properties
    private let reviewsWithImagesUseCase: ReviewsWithImagesUseCaseProtocol
    @Published var drafts = [Review]()
    @Published var review: Review

    // MARK: - Init
    init(reviewsWithImagesUseCase: ReviewsWithImagesUseCaseProtocol) {
        self.reviewsWithImagesUseCase = reviewsWithImagesUseCase
        self.review = .randomMockReview()
    }

    // MARK: - Functions
    @MainActor
    func onAppear() {
        getDrafts()

    }

    @MainActor
    func getReview() {
        review = .randomMockReview()
    }

    func saveDraft() {
        do {
            try reviewsWithImagesUseCase.save(&review)
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }

    @MainActor
    func getDrafts() {
        do {
            drafts = try reviewsWithImagesUseCase.getDrafts()
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }

    @MainActor
    func removeDraft(at review: Review) {
        do {
            try reviewsWithImagesUseCase.remove(review)

            guard let index = drafts.firstIndex(where: { $0.draftID == review.draftID}) else { return }
            drafts.remove(at: index)
        } catch {
            print("❌ ❌ Error: \(error.localizedDescription) ")
        }
    }
}
