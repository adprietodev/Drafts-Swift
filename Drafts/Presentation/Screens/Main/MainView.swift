//
//  MainView.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Productos") {
                    ProductBuilder.build()
                }
                NavigationLink("Reseñas") {
                    ReviewsBuilder.build()
                }
                NavigationLink("Coches") {
                    CarBuilder().build()
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}
