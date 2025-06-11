//
//  ReviewsView.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import SwiftUI

struct ReviewsView: View {
    @StateObject var viewModel: ReviewsViewModel
    @State var showCreateDraftReview: Bool = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                HStack {
                    Text("Add Review")
                        .padding(16)
                }
                .onTapGesture {
                    showCreateDraftReview.toggle()
                    viewModel.getReview()
                }
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )

                if showCreateDraftReview {
                    draftPanel
                }

                VStack(spacing: 16) {
                    HStack {
                        updateDraftsButton
                        Spacer()
                    }
                    if viewModel.drafts.isEmpty {
                        Text("No drafts")
                    } else {
                        Text("Drafts list:")
                        draftList
                    }
                }
            }
            .padding(.top, 32)
            .padding(.horizontal, 16)
        }
        .onAppear {
            viewModel.getDrafts()
        }
        .animation(.easeInOut, value: showCreateDraftReview)
        .transition(.opacity.combined(with: .move(edge: .top)))
        .navigationTitle("Reviews")
    }

    @ViewBuilder
    var draftList: some View {
        ForEach(viewModel.drafts, id: \.draftID) { draft in
            draftInfo(draft)
        }
    }

    @ViewBuilder
    var draftPanel: some View {
        VStack(spacing: 24) {
            HStack(spacing: 16) {
                if let imageData = viewModel.review.imageData,
                   let image = UIImage(data: imageData) {
                    Image(uiImage: image )
                        .clipShape(.circle)
                }

                VStack(alignment: .leading, spacing: 16){
                    customTextField(title: "Author Name: ", data: $viewModel.review.authorName)
                    Text("Rating: \(viewModel.review.rating)")
                }

            }
            VStack(spacing: 16) {
                customTextField(title: "Title:", data: $viewModel.review.title)
                customTextField(title: "Content: ", data: $viewModel.review.content, lineLimit: 6)
            }

            createDraftButton
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.gray.opacity(0.3))
        )
    }

    @ViewBuilder
    func customTextField(title: String, data: Binding<String>, lineLimit: Int? = nil) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(title)")
            TextField("", text: data, axis: .vertical)
                .lineLimit(nil)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(.white)
                )
        }
    }

    @ViewBuilder
    var createDraftButton: some View {
        HStack {
            Spacer()
            Text("Create Draft")
                .padding(16)
            Spacer()
        }
        .onTapGesture {
            showCreateDraftReview.toggle()
            viewModel.saveDraft()
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.black, lineWidth: 1)
        )
    }

    @ViewBuilder
    var updateDraftsButton: some View {
        HStack {
            Text("Update Drafts")
                .padding(8)
        }
        .onTapGesture {
            viewModel.getDrafts()
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.black, lineWidth: 1)
        )
    }

    @ViewBuilder
    func draftInfo(_ review: Review) -> some View{
        HStack(spacing: 16) {
            if let imageData = review.imageData,
               let image = UIImage(data: imageData) {
                Image(uiImage: image )
                    .clipShape(.circle)
            }
            VStack(alignment: .leading, spacing: 24){
                Text("Author: \(review.authorName)")
                Text(review.title)
            }
        }
        .swipeActions(edge: .trailing) {
            deleteDraftAction(at: review)
        }
    }

    @ViewBuilder
    private func deleteDraftAction(at review: Review) -> some View {
        Button(role: .destructive) {
            viewModel.removeDraft(at: review)
        } label: {
            VStack {
                Image(systemName: "wrongwaysign.fill")
                Text("Delete")
            }
        }
        .tint(.red)
    }

}

#Preview {
    ReviewsBuilder.build()
}
