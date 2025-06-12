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
            HStack {
                Button("Add random draft") {
                    viewModel.saveRandomDraft()
                }

                Button("Update drafts") {
                    viewModel.getDrafts()
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.drafts, id: \.draftID) { draft in
                        Button(draft.model) {
                            viewModel.getDraft(with: draft.draftID)
                        }
                    }
                }
            }

            if let car = viewModel.draft {
                VStack {
                    Text("Model: \(car.model)")
                    Text("Make: \(car.make)")
                    Text(car.isElectric ? "Electric" : "Gasoil")
                    Text("Year: \(car.year)")
                }
            }
        }
    }
}
