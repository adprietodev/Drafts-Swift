//
//  CarView.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 12/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import SwiftUI

struct CarView: View {
    @StateObject var viewModel: CarViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                HStack {
                    Button("Add random draft") {
                        viewModel.saveRandomDraft()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.blue, lineWidth: 1)
                            .fill(.white)
                    )

                    Spacer()

                    Button("Update drafts") {
                        viewModel.getDrafts()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.blue, lineWidth: 1)
                            .fill(.white)
                    )
                }
                .padding(.top, 32)
                .padding(.horizontal, 16)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(viewModel.drafts, id: \.draftID) { draft in
                            Button(draft.model) {
                                viewModel.getDraft(with: draft.draftID)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.blue, lineWidth: 1)
                                    .fill(.white)
                            )
                            .contextMenu {
                                Button(role: .destructive) {
                                    viewModel.removeDraft(with: draft.draftID)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                }

                if let car = viewModel.draft {
                    VStack(spacing: 16) {
                        Text("Model: \(car.model)")
                        Text("Make: \(car.make)")
                        Text(car.isElectric ? "Electric" : "Gasoil")
                        Text("Year: \(car.year)")
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}
