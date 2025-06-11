//
//  ProductsView.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    @StateObject var viewModel: ProductsViewModel
    @State var showCreateDraftProduct: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Toggle(isOn: $viewModel.isByUser, label: {
                Text(viewModel.isByUser ? "With user" : "Without user")
            })
            HStack {
                Text("Add Product")
                    .padding(16)
            }
            .onTapGesture {
                showCreateDraftProduct.toggle()
                viewModel.getProduct()
            }
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black, lineWidth: 1)
            )

            if showCreateDraftProduct {
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
            Spacer()
        }
        .onAppear {
            viewModel.getDrafts()
        }
        .animation(.easeInOut, value: showCreateDraftProduct)
        .transition(.opacity.combined(with: .move(edge: .top)))
        .padding(.top, 32)
        .padding(.horizontal, 16)
        .navigationTitle("Products")
    }

    @ViewBuilder
    var draftList: some View {
        List {
            ForEach(viewModel.drafts, id: \.draftID) { draft in
                draftInfo(draft)
            }
        }
        .listStyle(.plain)
    }

    @ViewBuilder
    var draftPanel: some View {
        VStack(spacing: 24) {
            HStack(spacing: 16) {
                if let imageData = viewModel.product.imageData,
                   let image = UIImage(data: imageData) {
                    Image(uiImage: image )
                        .clipShape(.circle)
                }

                VStack(alignment: .leading, spacing: 16){
                    customTextField(title: "Category: ", data: $viewModel.product.category)
                    Text("Price: \(viewModel.product.formatedPrice) €")
                }

            }
            VStack(spacing: 16) {
                customTextField(title: "Name:", data: $viewModel.product.name)
                customTextField(title: "Description: ", data: $viewModel.product.description, lineLimit: 6)
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
            showCreateDraftProduct.toggle()
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
    func draftInfo(_ product: Product) -> some View{
        HStack(spacing: 16) {
            if let imageData = product.imageData,
               let image = UIImage(data: imageData) {
                Image(uiImage: image )
                    .clipShape(.circle)
            }
            Text(product.name)
        }
        .swipeActions(edge: .trailing) {
            deleteDraftAction(at: product)
        }
    }

    @ViewBuilder
    private func deleteDraftAction(at product: Product) -> some View {
        Button(role: .destructive) {
            viewModel.removeDraft(at: product)
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
    ProductBuilder.build()
}
